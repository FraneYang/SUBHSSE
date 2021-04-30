using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// 图型分析信息项
    /// </summary>
    public class ChartAnalysisItem
    {
        /// <summary>
        /// ID
        /// </summary>
        public string DataId
        {
            get;
            set;
        }
        /// <summary>
        ///  类型
        /// </summary>
        public string Type
        {
            get;
            set;
        }
        /// <summary>
        /// 名称
        /// </summary>
        public string DataName
        {
            get;
            set;
        }
        /// <summary>
        /// 名称
        /// </summary>
        public string DataAllName
        {
            get;
            set;
        }
        /// <summary>
        /// 公司名称
        /// </summary>
        public string DataColName
        {
            get;
            set;
        }
        /// <summary>
        ///  总数
        /// </summary>
        public int DataSumCount
        {
            get;
            set;
        }

        /// <summary>
        /// 数量1
        /// </summary>
        public int DataCount1
        {
            get;
            set;
        }

        /// <summary>
        /// 数量2
        /// </summary>
        public int DataCount2
        {
            get;
            set;
        }
        /// <summary>
        /// 数量3
        /// </summary>
        public int DataCount3
        {
            get;
            set;
        }
        /// <summary>
        /// 数量4
        /// </summary>
        public int DataCount4
        {
            get;
            set;
        }
        /// <summary>
        /// 数量5
        /// </summary>
        public int DataCount5
        {
            get;
            set;
        }
    }
}
