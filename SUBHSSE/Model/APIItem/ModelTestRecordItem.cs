using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// 模拟考试项
    /// </summary>
    public class ModelTestRecordItem
    {
        /// <summary>
        /// 主键ID
        /// </summary>
        public string ModelTestRecordId
        {
            get;
            set;
        }
        /// <summary>
        /// 项目ID
        /// </summary>
        public string ProjectId
        {
            get;
            set;
        }
        /// <summary>
        /// 项目名称
        /// </summary>
        public string ProjectName
        {
            get;
            set;
        }
        /// <summary>
        /// 编制时间
        /// </summary>
        public string CompileDate
        {
            get;
            set;
        }
        /// <summary>
        /// 考生ID
        /// </summary>
        public string TestManId
        {
            get;
            set;
        }
        /// <summary>
        /// 考生姓名
        /// </summary>
        public string TestManName
        {
            get;
            set;
        }

        /// <summary>
        /// 单位Id
        /// </summary>
        public string UnitId
        {
            get;
            set;
        }
        /// <summary>
        /// 单位名称
        /// </summary>
        public string UnitName
        {
            get;
            set;
        }
        /// <summary>
        /// 考试开始时间
        /// </summary>
        public string TestStartTime
        {
            get;
            set;
        }
        /// <summary>
        /// 考试开始时间
        /// </summary>
        public DateTime? TestStartTimeD
        {
            get;
            set;
        }

        /// <summary>
        /// 考试结束时间
        /// </summary>
        public string TestEndTime
        {
            get;
            set;
        }
        /// <summary>
        /// 考试结束时间
        /// </summary>
        public DateTime? TestEndTimeD
        {
            get;
            set;
        }
        /// <summary>
        /// 考试时长
        /// </summary>
        public int Duration
        {
            get;
            set;
        }
        /// <summary>
        /// 总分
        /// </summary>
        public int TotalScore
        {
            get;
            set;
        }
        /// <summary>
        /// 题目数量
        /// </summary>
        public int QuestionCount
        {
            get;
            set;
        }
        /// <summary>
        /// 考试成绩
        /// </summary>
        public decimal TestScores
        {
            get;
            set;
        }
        /// <summary>
        /// 岗位ID
        /// </summary>
        public string WorkPostId
        {
            get;
            set;
        }
        /// <summary>
        /// 岗位名称
        /// </summary>
        public string WorkPostName
        {
            get;
            set;
        }
        /// <summary>
        /// 身份证号码
        /// </summary>
        public string IdentityCard
        {
            get;
            set;
        }
        /// <summary>
        /// 单选题分值
        /// </summary>
        public int SValue
        {
            get;
            set;
        }
        /// <summary>
        /// 多选题分值
        /// </summary>
        public int MValue
        {
            get;
            set;
        }
        /// <summary>
        /// 判断题分值
        /// </summary>
        public int JValue
        {
            get;
            set;
        }
        /// <summary>
        /// 状态
        /// </summary>
        public string States
        {
            get;
            set;
        }
        /// <summary>
        /// 考卷设置项
        /// </summary>
        public List<TestPlanTrainingItem> TestPlanTrainingItems
        {
            get;
            set;
        }

        /// <summary>
        ///  模拟考试考卷
        /// </summary>
        public List<TestRecordItemItem> TestRecordItemItems
        {
            get;
            set;
        }
    }
}
