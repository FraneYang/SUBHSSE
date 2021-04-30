using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class TrainingTaskItemScheduleItem
    {
        /// <summary>
        /// 主键ID
        /// </summary>
        public string TaskItemScheduleId
        {
            get;
            set;
        }

        /// <summary>
        /// 培训任务教材明细ID
        /// </summary>
        public string TaskItemId
        {
            get;
            set;
        }
        /// <summary>
        /// 人员ID
        /// </summary>
        public string PersonId
        {
            get;
            set;
        }
        /// <summary>
        /// 开始时间
        /// </summary>
        public string StartTime
        {
            get;
            set;
        }
        /// <summary>
        /// 结束时间
        /// </summary>
        public string EndTime
        {
            get;
            set;
        }
    }
}
