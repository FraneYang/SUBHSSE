﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;


namespace FineUIPro.Web
{
    public partial class ajax : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            string content = ReadFile("~/config/ajax_properties.txt");
            Dictionary<string, JObject> allControls = new Dictionary<string, JObject>();
            List<string> publicControls = new List<string>();
            JArray ja = JArray.Parse(content);
            foreach (JObject jo in ja)
            {
                if (jo.Value<bool>("public")) // .getBool("public"))
                {
                    publicControls.Add(jo.Value<string>("name")); //jo.getString("name"));
                }
                allControls.Add(jo.Value<string>("name"), jo); //jo.getString("name"), jo);
            }
            publicControls.Sort();

            StringBuilder sb = new StringBuilder();
            sb.Append("<ul class=\"mainlist\">");
            for (int i = 0, count = publicControls.Count; i < count; i++)
            {
                string name = publicControls[i];

                sb.Append("<li>");
                sb.AppendFormat("<div class=\"ui-widget ui-widget-content\">");

                sb.AppendFormat("<div class=\"ui-widget-header\">{0}</div>", name);

                // 计算控件name的所有AJAX属性
                List<string> ajaxProperties = new List<string>();

                string parentControlName = name;
                do
                {
                    JObject control = allControls[parentControlName];
                    foreach (string property in control.Value<JArray>("ajax")) // .getJSONArray("ajax").getArrayList())
                    {
                        if (!ajaxProperties.Contains(property))
                        {
                            ajaxProperties.Add(property);
                        }
                    }
                    parentControlName = control.Value<string>("parent"); //.getString("parent");

                } while (!String.IsNullOrEmpty(parentControlName));

                ajaxProperties.Sort();

                sb.Append("<div class=\"ajaxlist-container\">");
                sb.Append("<ul class=\"ajaxlist\">");
                foreach (string property in ajaxProperties)
                {
                    sb.AppendFormat("<li>{0}</li>", property);
                }
                sb.Append("</ul>");
                sb.Append("</div>");
                sb.Append("</div>");

                sb.Append("</li>");

                //if ((i + 1) % 6 == 0)
                //{
                //    sb.Append("</tr><tr>");
                //}
            }
            sb.Append("</ul>");

            litResult.Text = sb.ToString();
        }

        private string ReadFile(string filePath)
        {
            string content = String.Empty;

            using (System.IO.StreamReader sr = new System.IO.StreamReader(Server.MapPath(filePath)))
            {
                content = sr.ReadToEnd();
            }

            return content;
        }
    }
}
