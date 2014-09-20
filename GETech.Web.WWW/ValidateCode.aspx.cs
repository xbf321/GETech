using System;
using System.Drawing;

public partial class ValidateCode : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string code = Request.QueryString["code"];
        code = Goodspeed.Library.Security.DESCryptography.Decrypt(code, System.Configuration.ConfigurationManager.AppSettings["DESKey"]);
        CreateImage(code);
    }
    private void CreateImage(string checkCode)
    {
        //生成随机生成器
        Random random = new Random();

        int iwidth = (int)(checkCode.Length * 12.5);
        System.Drawing.Bitmap image = new System.Drawing.Bitmap(iwidth, 20);
        Graphics g = Graphics.FromImage(image);
        g.Clear(Color.White);

        Font f = new System.Drawing.Font("Arial", 12, System.Drawing.FontStyle.Regular);

        Brush b = new System.Drawing.SolidBrush(Color.Black);

        int j = 0;
        foreach (char c in checkCode)
        {
            g.DrawString(c.ToString(), f, b, j, 1);
            j += 12;
        }

        //画图片的前景噪音点
        for (int i = 0; i < 100; i++)
        {
            int x = random.Next(image.Width);
            int y = random.Next(image.Height);

            image.SetPixel(x, y, Color.FromArgb(random.Next()));
        }

        //画图片的边框线
        g.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);




        System.IO.MemoryStream ms = new System.IO.MemoryStream();
        image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
        Response.ClearContent();
        Response.ContentType = "image/Gif";
        Response.BinaryWrite(ms.ToArray());

        g.Dispose();
        image.Dispose();
        ms.Dispose();
    }
}
