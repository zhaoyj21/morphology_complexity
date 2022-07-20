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
            //for (int n = 176; n < 177; n++)
            for (int n = 1; n < 2; n++)
            {
                //int x = 1;

                //sphere
                string readpath = "E:\\Machine learning conformation recognition\\XYZ_pre_l500\\sphere\\" + n.ToString() + ".xyz";
                string savepath = "E:\\Machine learning conformation recognition\\XYZ_l500\\sphere\\" + n.ToString() + ".xyz";

                //cylinder
                //string readpath = "C:\\Users\\Administrator\\Desktop\\test\\data0513\\xyz\\" + n.ToString() + ".xyz";
                //string savepath = "C:\\Users\\Administrator\\Desktop\\test\\data0513\\xyz2\\" + n.ToString() + ".xyz";

                StreamReader srReadFile = new StreamReader(readpath);//读取文件
                FileStream fs = new FileStream(savepath, FileMode.Create);//保存文件位置

                //StreamReader srReadFile = new StreamReader("E:\\BISHE\\LammpsFile\\WORK\\XYZ\\sphere\\"+n.ToString()+".xyz");//读取文件
                //FileStream fs = new FileStream("E:\\BISHE\\LammpsFile\\WORK\\XYZ2\\sphere\\" + n.ToString()+".xyz", FileMode.Create);//保存文件位置
                //StreamReader srReadFile = new StreamReader("E:\\BISHE\\LammpsFile\\WORK\\DUMP\\cylinder\\" + n.ToString() + ".dump");//读取文件
                //FileStream fs = new FileStream("E:\\BISHE\\LammpsFile\\WORK\\TXT3\\cylinder\\cylinder_" + n.ToString() + ".txt", FileMode.Create);//保存文件位置

                StreamWriter swWriteFile = new StreamWriter(fs);
                string line; 
                //swWriteFile.WriteLine("XU YU ZU");
                int num_line = 0;int last11600 = 0;
                while (!srReadFile.EndOfStream)
                {
                    line = srReadFile.ReadLine();
                    //Console.WriteLine(line);
                    //while (line != null)
                    {
                        num_line++;
                        //Console.WriteLine(num_line);
                    }
                    if (line.Contains("Atoms. Timestep:"))
                    {
                        last11600 = num_line - 1;//更新需要的行数     
                        //Console.WriteLine("11600在" + last11600 + "行");
                    }
                }
                Console.WriteLine("11600在" + last11600 + "行");
                swWriteFile.Flush();
                swWriteFile.Close();
                fs.Close();
                srReadFile.Close();

                StreamReader srReadFile2 = new StreamReader(readpath);//读取文件
                FileStream fs2 = new FileStream(savepath, FileMode.Create);//保存文件位置

                StreamWriter swWriteFile2 = new StreamWriter(fs2);
                string line2;
                int num_line2 = 0;
                //last11600 = 754131;
                while (!srReadFile2.EndOfStream)
                {
                    line2 = srReadFile2.ReadLine();
                    //Console.WriteLine(line);
                    //while (line != null)
                    {
                        num_line2++;
                        //Console.WriteLine(num_line);
                    }
                    if (num_line2 >=last11600 )
                    {
                        swWriteFile2.WriteLine(line2);
                    }
                }
                //Console.WriteLine("11600在" + last11600 + "行");
                swWriteFile2.Flush();
                swWriteFile2.Close();
                fs.Close();
                srReadFile2.Close();
                Console.WriteLine(n);
            }

        }
        

    }
}
