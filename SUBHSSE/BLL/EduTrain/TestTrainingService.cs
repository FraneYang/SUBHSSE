using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public static class TestTrainingService
    {
        public static Model.SUBHSSEDB db = Funs.DB;

        /// <summary>
        /// 根据主键获取信息
        /// </summary>
        /// <param name="groupId"></param>
        /// <returns></returns>
        public static Model.Training_TestTraining GetTestTrainingById(string TrainingId)
        {
            return Funs.DB.Training_TestTraining.FirstOrDefault(e => e.TrainingId == TrainingId);
        }

        /// <summary>
        /// 添加试题类型信息
        /// </summary>
        /// <param name="Training"></param>
        public static void AddTestTraining(Model.Training_TestTraining TestTraining)
        {
            Model.SUBHSSEDB db = Funs.DB;
            Model.Training_TestTraining newTestTraining = new Model.Training_TestTraining
            {
                TrainingId = TestTraining.TrainingId,
                TrainingCode = TestTraining.TrainingCode,
                TrainingName = TestTraining.TrainingName,
                TrainingEngName = TestTraining.TrainingEngName,
                SupTrainingId = TestTraining.SupTrainingId ?? "0",
                IsEndLever = TestTraining.IsEndLever,
                ProjectId = TestTraining.ProjectId,
                CompanyId = TestTraining.CompanyId,
                UnitIds = TestTraining.UnitIds,
            };
            db.Training_TestTraining.InsertOnSubmit(newTestTraining);
            db.SubmitChanges();
        }

        /// <summary>
        /// 修改试题类型信息
        /// </summary>
        /// <param name="Training"></param>
        public static void UpdateTestTraining(Model.Training_TestTraining TestTraining)
        {
            Model.SUBHSSEDB db = Funs.DB;
            Model.Training_TestTraining newTestTraining = db.Training_TestTraining.FirstOrDefault(e => e.TrainingId == TestTraining.TrainingId);
            if (newTestTraining != null)
            {
                newTestTraining.TrainingCode = TestTraining.TrainingCode;
                newTestTraining.TrainingName = TestTraining.TrainingName;
                newTestTraining.TrainingEngName = TestTraining.TrainingEngName;
                newTestTraining.SupTrainingId = TestTraining.SupTrainingId;
                newTestTraining.IsEndLever = TestTraining.IsEndLever;
                newTestTraining.ProjectId = TestTraining.ProjectId;
                newTestTraining.CompanyId = TestTraining.CompanyId;
                newTestTraining.UnitIds = TestTraining.UnitIds;
                db.SubmitChanges();
            }
        }

        /// <summary>
        /// 根据主键删除信息
        /// </summary>
        /// <param name="TrainingId"></param>
        public static void DeleteTestTrainingById(string TrainingId)
        {
            Model.SUBHSSEDB db = Funs.DB;
            Model.Training_TestTraining TestTraining = db.Training_TestTraining.FirstOrDefault(e => e.TrainingId == TrainingId);
            if (TestTraining != null)
            {
                var TrainingItem = from x in db.Training_TestTrainingItem where x.TrainingId == TrainingId select x;
                if (TrainingItem.Count() > 0)
                {
                    db.Training_TestTrainingItem.DeleteAllOnSubmit(TrainingItem);
                }

                db.Training_TestTraining.DeleteOnSubmit(TestTraining);
                db.SubmitChanges();
            }
        }

        /// <summary>
        /// 根据上级ID获取试题类型列表
        /// </summary>
        /// <returns></returns>
        public static List<Model.Training_TestTraining> GetTestTrainingListBySupTrainingId(string supTrainingId)
        {
            return (from x in db.Training_TestTraining
                    where x.SupTrainingId == supTrainingId
                    orderby x.TrainingCode
                    select x).ToList();
        }

        /// <summary>
        /// 根据上级ID获取试题类型列表
        /// </summary>
        /// <returns></returns>
        public static List<Model.Training_TestTraining> GetTestTrainingListBySupTrainingIdProjectId(string supTrainingId, string projectId)
        {
            return (from x in db.Training_TestTraining
                    where x.SupTrainingId == supTrainingId &&  x.ProjectId.Contains(projectId)
                    orderby x.TrainingCode
                    select x).ToList();
        }

        /// <summary>
        /// 根据上级ID获取试题类型列表
        /// </summary>
        /// <returns></returns>
        public static List<Model.Training_TestTraining> GetTestTrainingListBySupTrainingIdUnitId(string supTrainingId, string unitId)
        {
            List<Model.Training_TestTraining> testTrainingLists = new List<Model.Training_TestTraining>();
            var getTestTrainings = from x in db.Training_TestTraining
                                where x.SupTrainingId == supTrainingId
                                select x;
            testTrainingLists = (from x in getTestTrainings
                                 where  x.UnitIds.Contains(unitId)
                                 orderby x.TrainingCode
                                 select x).ToList();
            var getProjects = ProjectService.GetProjectWorkByUnitIdList(unitId);
            if (getProjects.Count() > 0)
            {
                foreach (var item in getProjects)
                {
                    var getPTest = (from x in getTestTrainings
                                    where x.ProjectId.Contains(item.ProjectId)
                                    orderby x.TrainingCode
                                    select x).ToList();
                    if (getPTest.Count() > 0)
                    {
                        testTrainingLists.AddRange(getPTest);
                    }
                }
            }
            return testTrainingLists.Distinct().OrderBy(x=>x.TrainingCode).ToList();
        }
    }
}
