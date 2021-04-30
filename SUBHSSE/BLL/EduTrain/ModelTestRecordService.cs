using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    /// <summary>
    /// 模拟考试记录
    /// </summary>
    public static class ModelTestRecordService
    {
        /// <summary>
        /// 根据主键获取模拟考试记录
        /// </summary>
        /// <param name="ModelTestRecordId"></param>
        /// <returns></returns>
        public static Model.Training_ModelTestRecord GetModelTestRecordById(string ModelTestRecordId)
        {
            return Funs.DB.Training_ModelTestRecord.FirstOrDefault(e => e.ModelTestRecordId == ModelTestRecordId);
        }

        /// <summary>
        /// 根据主键删除培训计划信息
        /// </summary>
        /// <param name="planId"></param>
        public static void DeleteModelTestRecordByModelTestRecordId(string ModelTestRecordId)
        {
            var ModelTestRecord = Funs.DB.Training_ModelTestRecord.FirstOrDefault(e => e.ModelTestRecordId == ModelTestRecordId);
            if (ModelTestRecord != null)
            {
                var ModelTestRecordItem = from x in Funs.DB.Training_ModelTestRecordItem where x.ModelTestRecordId == ModelTestRecordId select x;
                if (ModelTestRecordItem.Count() > 0)
                {
                    foreach (var item in ModelTestRecordItem)
                    {
                        BLL.ModelTestRecordItemService.DeleteModelTestRecordItemmByModelTestRecordItemId(item.ModelTestRecordItemId);
                    }
                }

                var getTrainings = from x in Funs.DB.Training_ModelTestRecordTraining where x.ModelTestRecordId == ModelTestRecordId select x;
                if (getTrainings.Count() > 0)
                {
                    Funs.DB.Training_ModelTestRecordTraining.DeleteAllOnSubmit(getTrainings);
                    Funs.DB.SubmitChanges();
                }
                Funs.DB.Training_ModelTestRecord.DeleteOnSubmit(ModelTestRecord);
                Funs.DB.SubmitChanges();
            }
        }

        /// <summary>
        /// 更新没有结束时间且超时的考试记录
        /// </summary>
        public static int UpdateTestEndTimeNull(string modelTestRecordId)
        {
            int icount = 0;
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var testRecord = from x in db.Training_ModelTestRecord
                                 where !x.TestEndTime.HasValue && x.TestStartTime.Value.AddMinutes(x.Duration.Value) < DateTime.Now
                                 && (modelTestRecordId == null || x.ModelTestRecordId == modelTestRecordId)
                                 select x;
                if (testRecord.Count() > 0)
                {
                    foreach (var item in testRecord)
                    {
                        int duration = item.Duration ?? 90;
                        item.TestEndTime = item.TestStartTime.Value.AddMinutes(duration);
                        if (!item.TestScores.HasValue)
                        {
                            item.TestScores = 0;
                        }
                        db.SubmitChanges();
                        icount++;
                    }
                }
            }
            return icount;
        }
    }
}
