using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ChickenGang_Project.Helpers
{
    public static class ReplaceVietnameseSigns
    {
        public static string replace(string str)
        {
            if (string.IsNullOrEmpty(str))
                return str;

            str = str.ToLower();

            string[] signs = new string[] { "aeouidy", "áàạảãâấầậẩẫăắằặẳẵ", "éèẹẻẽêếềệểễ", "óòọỏõôốồộổỗơớờợởỡ", "úùụủũưứừựửữ", "íìịỉĩ", "đ", "ýỳỵỷỹ" };

            for (int i = 1; i < signs.Length; i++)
            {
                for (int j = 0; j < signs[i].Length; j++)
                {
                    str = str.Replace(signs[i][j], signs[0][i - 1]);
                }
            }

            return str;
        }
    }
}