using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;
using Syncfusion.Pdf.Parsing;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Informacni_system
{
    public partial class compareArticle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sPath = Server.MapPath("~/Aproved/");
            List<string> oFiles = Directory.GetFiles(sPath).ToList();
            oFiles.Sort();
            DropDownList1.DataSource = oFiles;
            DropDownList1.DataBind();
            DropDownList2.DataSource = oFiles;
            DropDownList2.DataBind();
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            errorlabel.Visible = false;
            if (DropDownList1.SelectedValue == DropDownList2.SelectedValue)
            {
                errorlabel.Visible = true;
            }
            else
            {
                string filePath1 = DropDownList1.SelectedValue;
                string filePath2 = DropDownList2.SelectedValue;

                // string filePath1 = Server.MapPath("~/Aproved/"+DropDownList1.SelectedValue );
                // string filePath2 = Server.MapPath("~/Aproved/"+DropDownList2.SelectedValue);
                FileStream fs1 = File.Open(filePath1, FileMode.OpenOrCreate, FileAccess.ReadWrite);
                FileStream fs2 = File.Open(filePath2, FileMode.OpenOrCreate, FileAccess.ReadWrite);
                PdfLoadedDocument loadedDocument = new PdfLoadedDocument(fs1);

                //Load the second PDF document
                PdfLoadedDocument loadedDocument1 = new PdfLoadedDocument(fs2);

                //Creating the list to store text data in PDF documents
                List<TextData> textData = new List<TextData>();
                List<TextData> textData1 = new List<TextData>();
                List<TextData> maxContainsData = new List<TextData>();
                List<TextData> diff = new List<TextData>();

                for (int i = 0; i < loadedDocument.Pages.Count; i++)
                {
                    //Get the page from first document
                    PdfLoadedPage loadedPage = loadedDocument.Pages[i] as PdfLoadedPage;
                    //Extract the text from page of first document 
                    string extractedText = loadedPage.ExtractText(out textData);

                    //Extract the text from page of second document 
                    string extractedText1 = loadedDocument1.Pages[i].ExtractText(out textData1);

                    int minCount = 0;

                    //Compare the text data count
                    if (textData.Count > textData1.Count)
                        maxContainsData = textData;
                    if (textData.Count < textData1.Count)
                        maxContainsData = textData1;

                    if (textData != textData1)
                    {
                        if (textData.Count == textData1.Count)
                            minCount = textData.Count;
                        else
                        {
                            List<int> count = new List<int>();
                            count.Add(textData.Count);
                            count.Add(textData1.Count);
                            minCount = count.Min();
                            //Add diff text to the list
                            diff.Add(maxContainsData[minCount]);
                        }
                        for (int j = 0; j < minCount; j++)
                        {
                            if ((textData[j].Text != textData1[j].Text) && (textData[j].Bounds != textData1[j].Bounds))
                            {
                                //Add diff text to the list
                                diff.Add(textData[j]);
                            }
                        }
                    }
                    //Highlight the changed text
                    foreach (TextData data in diff)
                    {
                        loadedPage.Graphics.DrawRectangle(PdfPens.Red, PdfBrushes.Transparent, data.Bounds);
                    }
                }

                //Save and close the document 
                string filePath3 = Server.MapPath("~/Aproved/");
                loadedDocument.Save(filePath3 + "ComparedPDF.pdf");
                loadedDocument.Close(true);
                loadedDocument1.Close(true);

                //This will open the PDF file so, the result will be seen in default PDF viewer 
                System.Diagnostics.Process.Start(filePath3 + "ComparedPDF.pdf");
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }

        protected void Unnamed4_Click(object sender, EventArgs e)
        {
            string filePath3 = Server.MapPath("~/Aproved/");
            System.Diagnostics.Process.Start(filePath3 + "ComparedPDF.pdf");
        }

     
    }
}