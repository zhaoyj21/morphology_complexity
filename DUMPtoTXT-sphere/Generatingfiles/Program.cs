using System;
using System.Text;
using System.IO;
using System.Collections.Generic;
using System.Linq;


namespace Generatingfiles
{
    class Program
    {
        static void Main(string[] args)
        {
            ///<summary>
            ///每一个dump文件中有多个ITEM，每个ITEM有多个ATOMS在第四行中写有，目的是读取原子的XU,YU,ZU数据
            ///先读取dump文件中每个ITEM里ATOMS的数量，再读取ITEM中的原子坐标数据写入txt文件
            ///</summary>
            ///
            for (int n = 1; n < 1081; n++)
            {
                int m = n+1080;
                StreamReader srReadFile = new StreamReader("D:\\ML-generate\\DUMP\\sphere\\" + n.ToString()+".dump");//读取文件
                FileStream fs = new FileStream("D:\\ML-generate\\TXT\\sphere\\" + m.ToString()+".txt", FileMode.Create);//保存文件位置
                //StreamReader srReadFile = new StreamReader("E:\\BISHE\\LammpsFile\\WORK\\DUMP\\cylinder\\" + n.ToString() + ".dump");//读取文件
                //FileStream fs = new FileStream("E:\\BISHE\\LammpsFile\\WORK\\TXT0518\\" + n.ToString() + ".txt", FileMode.Create);//保存文件位置

                StreamWriter swWriteFile = new StreamWriter(fs);
                string line;
                //swWriteFile.WriteLine("XU YU ZU");
                int num = 0;
                while (!srReadFile.EndOfStream)
                {
                    line = srReadFile.ReadLine();
                    if (line.Contains("ITEM: NUMBER OF ATOMS"))
                    {
                        num = int.Parse(srReadFile.ReadLine());//再往下读一行得到数字                  
                    }
                    if (line.Contains("id xu yu zu c_k c_p c_bo c_di"))
                    {
                        for (int i = 0; i < num; i++)
                        {
                            line = srReadFile.ReadLine();
                            string[] data = line.Split(' ');
                            string nu = data[0];
                            string xu = data[1];
                            string yu = data[2];
                            string zu = data[3];
                            swWriteFile.WriteLine(nu+" "+ xu + " " + yu + " " + zu);

                        }
                        break;//只读取一项
                    }
                }
                swWriteFile.Flush();
                swWriteFile.Close();
                fs.Close();
                srReadFile.Close();
            }
        }
        

    }
}
