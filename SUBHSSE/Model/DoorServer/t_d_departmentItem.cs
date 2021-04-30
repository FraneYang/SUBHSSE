using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// 门禁 -部门
    /// </summary>
    public class t_d_departmentItem
    {
        /// <summary>
        /// ID
        /// </summary>
        public int DepartmentID
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public string DepartmentName
        {
            get;
            set;
        }

        /// <summary>
        /// 
        /// </summary>
        public int? ParentID
        {
            get;
            set;
        }
    
        /// <summary>
        /// 
        /// </summary>
        public int? IsDel
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public int? IsDown
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public string ParentDepartmentName
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public int? IsEnable
        {
            get;
            set;
        }
    }
}
