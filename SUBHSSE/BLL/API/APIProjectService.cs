using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EmitMapper;

namespace BLL
{
    public static class APIProjectService
    {
        /// <summary>
        /// 根据userId获取用户信息
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static List<Model.ProjectItem> geProjectsByUserId(string userId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                List<Model.Base_Project> projects = new List<Model.Base_Project>();
                var getUser = db.Sys_User.FirstOrDefault(e => e.UserId == userId);
                if (getUser != null)
                {
                    if (CommonService.IsThisUnitLeaderOrManage(userId))
                    {
                        projects = (from x in db.Base_Project
                                    where x.ProjectState == null || x.ProjectState == BLL.Const.ProjectState_1
                                    select x).ToList();
                    }
                    else
                    {
                        if (CommonService.IsLeaderOrManage(userId))
                        {
                            var getProject1 = (from x in db.Base_Project
                                               where x.UnitId == getUser.UnitId && (x.ProjectState == null || x.ProjectState == BLL.Const.ProjectState_1)
                                               select x).ToList();
                            if (getProject1.Count() > 0)
                            {
                                projects.AddRange(getProject1);
                            }
                        }
                        else
                        {
                            var getProject2 = (from x in db.Project_ProjectUser
                                               join y in db.Base_Project on x.ProjectId equals y.ProjectId
                                               where x.UserId == userId && (y.ProjectState == null || y.ProjectState == BLL.Const.ProjectState_1)
                                               select y).ToList();
                            if (getProject2.Count() > 0)
                            {
                                projects.AddRange(getProject2);
                            }
                        }
                    }
                }
                else
                {
                    var getPerson = db.SitePerson_Person.FirstOrDefault(x => x.PersonId == userId);
                    if (getPerson != null)
                    {
                        projects = (from x in db.SitePerson_Person
                                    join y in db.Base_Project on x.ProjectId equals y.ProjectId
                                    where x.IdentityCard == getPerson.IdentityCard && (y.ProjectState == null || y.ProjectState == BLL.Const.ProjectState_1)
                                    select y).ToList();
                    }
                }
                if (projects.Count() == 0)
                {
                    projects = (from x in db.Base_Project
                                where x.ProjectName.Contains("演示") || x.ProjectName.Contains("测试")
                                select x).ToList();
                }
                projects = projects.Distinct().OrderBy(x => x.ProjectName).ToList();
                return ObjectMapperManager.DefaultInstance.GetMapper<List<Model.Base_Project>, List<Model.ProjectItem>>().Map(projects);
            }
        }

        /// <summary>
        /// 根据userId获取用户信息
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static List<Model.ProjectItem> getALLProjectsByUserId(string userId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getUser = db.Sys_User.FirstOrDefault(e => e.UserId == userId);
                if (getUser != null)
                {
                    var projects = (from x in db.Project_ProjectUser
                                    join y in db.Base_Project on x.ProjectId equals y.ProjectId
                                    where x.UserId == userId
                                    orderby y.ProjectCode
                                    select y).ToList();
                    return ObjectMapperManager.DefaultInstance.GetMapper<List<Model.Base_Project>, List<Model.ProjectItem>>().Map(projects);
                }
                else
                {

                    var projects = (from x in db.SitePerson_Person
                                    join y in db.Base_Project on x.ProjectId equals y.ProjectId
                                    where x.PersonId == userId
                                    orderby y.ProjectCode
                                    select y).ToList();
                    return ObjectMapperManager.DefaultInstance.GetMapper<List<Model.Base_Project>, List<Model.ProjectItem>>().Map(projects);
                }
            }
        }

        /// <summary>
        /// 根据userId获取用户信息
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static Model.ProjectItem getProjectByProjectId(string projectId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getproject = db.Base_Project.FirstOrDefault(x => x.ProjectId == projectId);

                return ObjectMapperManager.DefaultInstance.GetMapper<Model.Base_Project, Model.ProjectItem>().Map(getproject);
            }
        }
    }
}
