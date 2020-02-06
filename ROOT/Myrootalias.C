
//______________________________________________________________________________
void edit(char *file)
{
   char s[64], *e;
   if (!strcmp(gSystem->GetName(), "WinNT")) {
      if (e = getenv("EDITOR"))
         sprintf(s, "start %s %s", e, file);
      else
         sprintf(s, "start notepad %s", file);
   } else {
      if (e = getenv("EDITOR"))
         sprintf(s, "%s %s", e, file);
      else
         sprintf(s, "xterm -e vi %s &", file);
   }
   gSystem->Exec(s);
}

//______________________________________________________________________________
void ls(char *path=0)
{
   char s[256] = (!strcmp(gSystem->GetName(), "WinNT")) ? "dir /w " : "ls ";
   if (path) strcat(s,path);
   gSystem->Exec(s);
}



//______________________________________________________________________________
void dir(char *path=0)
{
   char s[256] = (!strcmp(gSystem->GetName(), "WinNT")) ? "dir " : "ls -l ";
   if (path) strcat(s,path);
   gSystem->Exec(s);
}

//______________________________________________________________________________
char *pwd()
{
    return gSystem->WorkingDirectory();
}


//______________________________________________________________________________
char *cd(char *path=0)
{
 if (path)
   gSystem->ChangeDirectory(path);
 return pwd();
}
void exe(char *str){
gSystem->Exec(str);
}

//______________________________________________________________________________
void bexec2(char *macro)
{
printf("in bexec dir=%s\n",dir.Data());
   if (gROOT->IsBatch()) printf("Processing benchmark: %s\n",macro);
   TPaveText *summary = (TPaveText*)bench->GetPrimitive("TPave");
   TText *tmacro = summary->GetLineWith(macro);
   if (tmacro) tmacro->SetTextColor(4);
   bench->Modified(); bench->Update();

   gROOT->Macro(macro);

   TPaveText *summary2 = (TPaveText*)bench->GetPrimitive("TPave");
   TText *tmacro2 = summary2->GetLineWith(macro);
   if (tmacro2) tmacro2->SetTextColor(2);
   bench->Modified(); bench->Update();
}
void mycanvas(){
  TCanvas *c1 = new TCanvas("c1","Graph Draw Options",200,100, 600, 500);

  gStyle->SetFillColor(kWhite);
  gStyle->SetCanvasColor(kWhite);
  gStyle->SetFrameFillColor(kWhite);
  // Set margin of pad
  gStyle->SetPadRightMargin(0.15);
  gStyle->SetPadTopMargin(0.05);
  gStyle->SetPadLeftMargin(0.15);
  gStyle->SetPadBottomMargin(0.15);

  gStyle->SetPadBorderMode(0);

 gStyle->SetOptStat(1100110);

  gStyle->SetStatY(0.95);
  gStyle->SetStatX(0.9);

  gStyle->SetTitleX(0.1);
  gStyle->SetTitleY(0.95);

  //gStyle->SetPadGridX(1);
  //gStyle->SetPadGridY(1);

  gStyle->SetTitleOffset(1.2,"X");
  gStyle->SetTitleOffset(1.2,"Y");

  gStyle->SetTitleStyle(0);  

  gStyle->UseCurrentStyle();
  c1->UseCurrentStyle();
}
void setcanvas(){
  gStyle->SetFillColor(kWhite);
  gStyle->SetCanvasColor(kWhite);
  gStyle->SetFrameFillColor(kWhite);
  // Set margin of pad
  gStyle->SetPadRightMargin(0.05);
  gStyle->SetPadTopMargin(0.05);
  gStyle->SetPadLeftMargin(0.1);
  gStyle->SetPadBottomMargin(0.13);

  gStyle->SetPadBorderMode(0);

 gStyle->SetOptStat(1100110);

  gStyle->SetStatY(0.95);
  gStyle->SetStatX(0.95);

  gStyle->SetTitleX(0.1);
  gStyle->SetTitleY(0.95);

  gStyle->SetPadGridX(1);
  gStyle->SetPadGridY(1);

  gStyle->SetTitleOffset(1.2,"X");
  gStyle->SetTitleOffset(1.2,"Y");

  gStyle->SetTitleStyle(0);

  gStyle->UseCurrentStyle();
}
void canvas(int wide = 600, int high = 500)
{  
  printf("Create Canvas");
  TCanvas *c1 = new TCanvas("c1","Graph Draw Options",200,100, wide, high);
  //   *c1 = new TCanvas("c1","Graph Draw Options",200,10, wide, high);
  //   c1->Divide(nx,ny);
  //   gStyle->SetCanvasColor(10);
  gStyle->SetFillColor(kWhite);
  gStyle->SetCanvasColor(kWhite);
  gStyle->SetFrameFillColor(kWhite);
  //   c1->SetGrid();
  //   c1->SetGrid(1.5,1.5);
  //   c1->SetBorderMode(0);
  //   c1->SetBorderSize(1);
  //   c1->SetFixedAspectRatio(kTRUE);
  gStyle->SetOptDate(kFALSE);
  gStyle->SetOptStat(kTRUE);

  gStyle->SetOptStat(1100110);
  gStyle->SetTitleBorderSize(1);
  gStyle->SetOptTitle(0);
  gStyle->SetStatBorderSize(2);
  gStyle->SetStatX(0.88);
  gStyle->SetStatY(0.88);
  gStyle->SetStatW(0.3);
  gStyle->SetStatH(0.25);
  gStyle->SetStatFont(82);
  gStyle->SetStatColor(kWhite);
  gStyle->SetStatTextColor(kBlack);
  gStyle->SetStatFontSize(0.045);
  //   gStyle->SetGridStyle(4);
  //   gStyle->SetGridWidth(0.05);
  //   gStyle->SetGridColor(kBlue);
  gStyle->SetNdivisions(505,"X");
  gStyle->SetNdivisions(505,"Y");
  //   gStyle->SetAxisColor(kBlue);
  //   gStyle->SetTitleSize(1);

  gStyle->SetTitleXSize(0.08);
  gStyle->SetTitleXOffset(0.85);
  gStyle->SetTitleYSize(0.08);
  gStyle->SetTitleYOffset(1.2);
  gStyle->SetTitleFont(1);
  //   gStyle->CenterTitle();
  //   gStyle->SetTitleYSize()
  gStyle->SetTitleX(0.1);
  gStyle->SetTitleY(0.2);
  gStyle->SetTitleFont(82,"X");
  gStyle->SetTitleFont(82,"Y");
  gStyle->SetTitleAlign(22);

  gStyle->SetPadBorderMode(0);
  gStyle->SetPadBorderSize(0);
  // Margins for labels etc.
  gStyle->SetPadLeftMargin(0.18);//left label to bianjie
  gStyle->SetPadBottomMargin(0.17);
  gStyle->SetPadRightMargin(0.1);
  gStyle->SetPadTopMargin(0.1);

  gStyle->SetPadTickX(kTRUE);
  gStyle->SetPadTickY(kTRUE);

  gStyle->SetLabelSize(0.06,"xyz");
  gStyle->SetLabelFont(82, "xyz");
  gStyle->SetLabelOffset(0.01,"xyz");
  //   gStyle->SetLabelOffset(0.01);
  gStyle->SetHistTopMargin(0.15);
  gStyle->SetHistLineWidth(2);

  gStyle->SetFrameBorderSize(12);
  gStyle->SetFrameBorderMode(0);
  gStyle->SetFrameLineColor(1);
  gStyle->SetFrameLineStyle(1);
  gStyle->SetFrameLineWidth(2);
  gStyle->SetFrameFillStyle(3);

  gStyle->SetLegendBorderSize(0);

  //   c1->Divide(nx,ny);
}


void diff(TH1F *hist1, TH1F *hist2,Char_t *str1,Char_t *str2)
{
  TH1F *hist3 =(TH1F*)hist2->Clone();
  hist3->SetName("hist3");
  Float_t sum1 = 0;
  Float_t sum2 = 0;
  int Nx1 = hist1->GetNbinsX();
  int Nx2 = hist2->GetNbinsX();
   for ( int k=1;k<=Nx1;k++) {
      sum1 += hist1->GetBinContent(k);
   }

   for ( int l=1;l<=Nx2;l++) {
      sum2 += hist2->GetBinContent(l);
   }

//  Float_t sum1 = hist1->GetSum();
//  Float_t sum2 = hist3->GetSum();
  if(sum2==0){
   printf("No entry from second Histogram \n");
   return 0;};

  Float_t ratio = sum1/sum2;

//  hist1->Draw();
  hist3->Scale(ratio);
  hist1->SetLineColor(kRed);
  hist1->SetLineWidth(2);
  hist1->SetMarkerStyle(20);
  hist1->SetMarkerColor(kBlue);
  hist1->SetMarkerSize(1.0);
  hist1->SetLineWidth(2);
  gStyle->SetOptStat(0);
    hist1->SetMinimum(0);
    hist3->SetMinimum(0);

  if(hist3->GetMaximum()>hist1->GetMaximum()){
    hist3->Draw();
    //  gStyle->SetOptStat(1110110);
    //  gStyle->SetOptStat(0);
    hist1->Draw("esame");
  }else{
    hist1->Draw("e");
    hist3->Draw("same");
  }

    hist1->SetMinimum(0);
    hist3->SetMinimum(0);
  printf("Normalization factor == %f \n", ratio);
  //leg=new TLegend(0.75,0.75,0.95,0.95);
  //leg->AddEntry(hist1,str1);
  //leg->AddEntry(hist3,str2);
  //leg->Draw();
}

void comp(TH1F *hist1, TH1F *hist2,Char_t *str1,Char_t *str2)
{
  hist1->SetLineColor(kRed);
  hist1->SetLineWidth(2);
  hist1->SetMarkerStyle(20);
  hist1->SetMarkerColor(kBlue);
//  hist1->SetMarkerSize(0.4);
  hist1->SetMarkerSize(0.5);
  hist2->SetLineWidth(2);
  hist2->SetLineColor(kGreen);
  //hist2->SetFillColor(kGreen);
  //hist2->SetFillStyle(1001);
  gStyle->SetOptStat(0);
  if(hist2->GetMaximum()>hist1->GetMaximum()){
    hist2->Draw("HISTO");
    hist1->Draw("esame");
  }else{
    hist1->Draw("e");
    hist2->Draw("sameHISTO");
  }
  leg=new TLegend(0.75,0.75,0.9,0.95);
  leg->AddEntry(hist1,str1);
  leg->AddEntry(hist2,str2);
  leg->Draw();
}

void solid_comp(TH1F *hist1, TH1F *hist2,Char_t *str1,Char_t *str2){
  hist1->SetLineWidth(2);
  hist2->SetLineWidth(2);
  hist2->SetLineColor(kGreen);
  hist2->SetFillColor(kGreen);
  hist2->SetFillStyle(1001);
  gStyle->SetOptStat(0);
  if(hist2->GetMaximum()>hist1->GetMaximum()){
    hist2->Draw();
    hist1->Draw("sameHISTO");
  }else{
    hist1->Draw("HISTO");
    hist2->Draw("same");
  }
  leg=new TLegend(0.75,0.75,0.95,0.95);
  leg->AddEntry(hist1,str1);
  leg->AddEntry(hist2,str2);
  leg->Draw();
}

//void diff(TH1F *hist1, TH1F *hist2, int i=0, int j=100 )
//{
//  TH1F *hist3 =(TH1F *)hist2->Clone();
//  hist3->SetName("hist3");
//  Float_t sum1 = 0.0;
//  Float_t sum2 = 0.0;
//  int Nx1 = hist1->GetNbinsX();
//  int Nx2 = hist3->GetNbinsX();
//  if(i<1){
//   printf("First bin number given is less than 1! Change to be 1. \n");
//   i=1;}
//  if(j>Nx2)printf("Bin number given is over! \n");
//
//   for ( int k=i;k<=j;k++) {
//      sum1 = sum1 + hist1->GetBinContent(k);
//   }
//
//   for ( int l=i;l<=j;l++) {
//      sum2 = sum2+ hist3->GetBinContent(l);
//   }
//
//  Float_t ratio = (sum1+0.0)/sum2;
//
//  hist3->Scale(ratio);
//  hist1->SetLineColor(kRed);
//  hist1->SetMarkerStyle(20);
//  hist1->SetMarkerColor(kBlue);
//  hist1->SetMarkerSize(0.4);
//  gStyle->SetOptStat(0);
//  hist3->Draw();
////  gStyle->SetOptStat(1110110);
//  hist1->Draw("esame");
//
//  printf("Normalization factor == %f \n", ratio);
//  printf("From bin %i to bin %i \n", i, j);
//
//}

void diff(TH1F *hist1, TH1F *hist2, double begin, double end,Char_t *str1,Char_t *str2 )
{
  TH1F *hist3 =(TH1F *)hist2->Clone();
  hist3->SetName("hist3");
  Float_t sum1 = 0.0;
  Float_t sum2 = 0.0;
  int Nx1 = hist1->GetNbinsX();
  int Nx2 = hist3->GetNbinsX();


  Float_t  internal=(hist1->GetBinCenter(Nx1)-hist1->GetBinCenter(1))/Nx1;
  int i=(int)((begin-hist1->GetBinCenter(1))/internal)+1;
  int j=(int)((end-hist1->GetBinCenter(1))/internal)+1;



  if(i<1){
    printf("First bin number given is less than 1! Change to be 1. \n");
    i=1;}
    if(j>Nx2)printf("Bin number given is over! \n");

    for ( int k=i;k<=j;k++) {
      sum1 = sum1 + hist1->GetBinContent(k);
    }

    for ( int l=i;l<=j;l++) {
      sum2 = sum2+ hist3->GetBinContent(l);
    }

    Float_t ratio = (sum1+0.0)/sum2;

    hist3->Scale(ratio);
    hist1->SetLineColor(kRed);
    hist1->SetLineWidth(2);
    hist1->SetMarkerStyle(20);
    hist1->SetMarkerColor(kBlue);
    //hist1->SetMarkerSize(1.0);
    hist1->SetMarkerSize(0.5);
    hist2->SetLineWidth(2);
    gStyle->SetOptStat(0);
    if(hist3->GetMaximum()>hist1->GetMaximum()){
      hist3->Draw("HIST");
      //  gStyle->SetOptStat(1110110);
      hist1->Draw("esame");
    }else{
      hist1->Draw("e");
      hist3->Draw("sameHIST");
    }

    printf("Normalization factor == %f \n", ratio);
    printf("From bin %i to bin %i \n", i, j);
    leg=new TLegend(0.75,0.75,0.95,0.95);
    leg->AddEntry(hist1,str1);
    leg->AddEntry(hist3,str2);
    leg->Draw();

}
void diff(TH1F *hist1, TH1F *hist2,TH1F *hist4, double begin, double end,Char_t *str1,Char_t *str2 )
{
  TH1F *hist3 =(TH1F *)hist2->Clone();
  hist3->SetName("hist3");
  Float_t sum1 = 0.0;
  Float_t sum2 = 0.0;
  int Nx1 = hist1->GetNbinsX();
  int Nx2 = hist3->GetNbinsX();


  Float_t  internal=(hist1->GetBinCenter(Nx1)-hist1->GetBinCenter(1))/Nx1;
  int i=(int)((begin-hist1->GetBinCenter(1))/internal)+1;
  int j=(int)((end-hist1->GetBinCenter(1))/internal)+1;



  if(i<1){
    printf("First bin number given is less than 1! Change to be 1. \n");
    i=1;}
    if(j>Nx2)printf("Bin number given is over! \n");

    for ( int k=i;k<=j;k++) {
      sum1 = sum1 + hist1->GetBinContent(k);
    }

    for ( int l=i;l<=j;l++) {
      sum2 = sum2+ hist3->GetBinContent(l);
    }

    Float_t ratio = (sum1+0.0)/sum2;

    hist3->Scale(ratio);
    hist1->SetLineColor(kRed);
    hist1->SetLineWidth(2);
    hist1->SetMarkerStyle(20);
    hist1->SetMarkerColor(kBlue);
    hist1->SetMarkerSize(1.0);
    hist2->SetLineWidth(2);
    gStyle->SetOptStat(0);
    if(hist3->GetMaximum()>hist1->GetMaximum()){
      hist3->Draw();
      //  gStyle->SetOptStat(1110110);
      hist4->SetFillColor(kGreen);
      hist4->Draw("same");
      hist1->Draw("esame");
    }else{
      hist1->Draw("e");
      hist4->SetFillColor(kGreen);
      hist4->Draw("same");
      hist3->Draw("same");
    }

    printf("Normalization factor == %f \n", ratio);
    printf("From bin %i to bin %i \n", i, j);
    leg=new TLegend(0.75,0.75,0.95,0.95);
    leg->AddEntry(hist1,str1);
    leg->AddEntry(hist3,str2);
    leg->Draw();

}
void add(TH1F *hist1, TH1F *hist2, double sl1=1.0, double sl2=1.0, TH1F *hist5 )
{
  TH1F *hist3 = hist1->Clone();
  TH1F *hist4 = hist2->Clone();
  hist3->Scale(sl1);
  hist4->Scale(sl2);
  *hist5 = *hist3 + *hist4;

}

void draw(TH1F *hist1){hist1->Draw();}

Float_t count(TH1F *hist1,double begin,double end){
  int Nx1 = hist1->GetNbinsX();

  Float_t  internal=(hist1->GetBinCenter(Nx1)-hist1->GetBinCenter(1))/Nx1;
  int i=(int)((begin-hist1->GetBinCenter(1))/internal)+1;
  int j=(int)((end-hist1->GetBinCenter(1))/internal)+1;
  Float_t sum = 0;
  for ( int k=i;k<=j;k++) {
    sum += hist1->GetBinContent(k);
  }
  std::cout<<"Histogram of event from bin "<<begin<<" to "<<end<<" is: "<<sum<<endl;
  return sum;

}
void setAxis(TH1F *hist1){
  TAxis *xaxis1 = histo1->GetXaxis();
  TAxis *yaxis1 = histo1->GetYaxis();
  xaxis1->CenterTitle();
  yaxis1->CenterTitle();
  xaxis1->SetTitleSize(0.06);
  yaxis1->SetTitleSize(0.06);
  xaxis1->SetLabelSize(0.06);
  yaxis1->SetLabelSize(0.06);
  xaxis1->SetTitleFont(22);
  yaxis1->SetTitleFont(22);
  yaxis1->SetLabelFont(22);
}
