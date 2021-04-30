using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// 考试统计项
    /// </summary>
    public class TestStatisticsItem
    {
        /// <summary>
        /// ID
        /// </summary>
        public string ID
        {
            get;
            set;
        }
        /// <summary>
        /// 名称
        /// </summary>
        public string Name
        {
            get;
            set;
        }
        /// <summary>
        /// 总人数
        /// </summary>
        public int TotalPersonCount
        {
            get;
            set;
        }
        /// <summary>
        /// 考试人数
        /// </summary>
        public int TestPersonCount
        {
            get;
            set;
        }
        /// <summary>
        /// 合格人数
        /// </summary>
        public int PassPersonCount
        {
            get;
            set;
        }
    }
}
