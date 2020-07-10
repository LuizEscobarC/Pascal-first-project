//{ Objetivo --> Usar tudo o que aprendi }
////
////
////
Program Diaria ;
Var  i, V: integer;
Login, Senha, BV, Crono: String;
////
Procedure Cronometro;
var
hi,mi,si,csi,hh,mm,ss,cs:word;
Begin
  ClrScr;
  hi:=0;
  mi:=0;
  si:=0;
  csi:=0;
  cs:=0;
  gettime(hi,mi,si,csi);
  TextColor(2);
  Lowvideo;                                                                             //cronometro
  gotoxy(80,12);
  Write ('Hora atual:');
  Repeat
    gettime(hh,mm,ss,cs);
    gotoxy(80,14);
    Write (hh,':',mm,':',ss,':',cs);
  until keypressed;
  gotoxy(48,16);
  Lowvideo;
  Write('Demorou, ',hh-hi,' Horas/ ',mm-mi,' minutos/ ',ss-si,' segundos/ ',cs-csi,' centésimos, para executar a tarefa!');
  readkey;
  readln;
End;
Procedure Armazem;
Var VetorArmazem : Array[1..100] of string;
ValorFinal, i, numTarefa : integer;
Continuar : String;
Begin
  GotoXY(50,22);
  TextBackGround(10);
  TextColor(14);
  Write ('LUIZ, QUANTAS TAREFAS DESEJA ARMAZENAR HOJE ? (1,2,3,4...)   ');
  TextBackground(White);
  Textcolor(LightBlue);
  Write ('-->');
  TextBackGround(Black);
  Write('   ');
  Readln(ValorFinal);
  For i:= 1 to ValorFinal do
  Begin
    Clrscr;
    GotoXY(66,22);
    Write ('Digite a - ',i,' - tarefa: ');
    Readln(VetorArmazem[i]);
    Clrscr;
    Repeat
      GotoXY(62,24);
      Write ('QUAL TAREFA DESEJA CONSULTAR ? (1,2,3,4...)   ');
      Readln(numTarefa);
      GotoXY(68,26);
      TextBackGround(14);
      TextColor(LightRed);
      Writeln ('A TAREFA A FAZER É  ->> ', VetorArmazem[numTarefa],' <<- ');
      TextBackGround(Black);
      GotoXY(50,30);
      Write ('Deseja Iniciar a contagem de tempo para fazer essa tarefa ? (SIM/NAO) ');
      Readln(Crono);
      If (Upcase(Crono)) = 'SIM' then
        Begin
          Cronometro;
        end;
                                                                             //Armazenagem
        TextColor(14);
        GotoXY(68,28);
        Write ('Deseja continuar ? (SIM/NAO) -> ');
        Readln(Continuar);
        
        Clrscr;
    Until (Upcase(Continuar)) = 'NAO';
  end;
End;
    
    ////
    Begin                     //Login and senha
      GotoXY(74,3);
      BV:= 'BEM VINDO LUIZ !!! :D ';
      TextBackground(Black);
      For i:= 1 to Length(BV)do
      Begin
        TextColor(Blink + 12);
        Write (BV[i]);
        Delay(50);
      end;                // termina o Welcome
      While V <> 1 do
      Begin
        Textbackground(black);
        GotoXY(3,6);
        TextBackGround(1);
        TextColor(blink+Red);
        lowvideo;
        Write ('|||||||||||||||||||||| Digite seu Login:   ');
        TextColor(White);
        TextBackGround(Black);
        Write('  ');
        TextBackGround(4);
        Write (' >>> ');
        TextBackGround(Black);
        TextColor(2);
        Write('  ');
        TextColor(Red);
        Read (Login);
        TextBackGround(Black);
        
        If (Upcase(Login)) = 'ANONYMOUSLPH' then
        Begin
            GotoXY (70,6);
            TextBackGRound(BLUE);
            TextColor(LightGreen);
            Write (' V ');
            V:= 1;
            GotoXY(55,11);
            TextColor(Green);
            Writeln('Login Correto!!! ');
        end
          Else
          Begin
            GotoXY (70,6);
            TextBackGround(BLUE);
            TextColor(LightRed);
            Write (' X ');
            V:= 2;
            GotoXY(55,11);
            TextColor(RED);
            Writeln('Login incorreto!!!');
          end;
          
          
          GotoXY(3,8);
          TextBackGround(1);
          TextColor(blink+Red);
          lowvideo;
          Write ('||||||||||||||||||||| Digite sua Senha:    ');
          TextColor(White);
          TextBackGround(Black);
          Write('  ');
          TextBackGround(4);
          Write (' >>> ');
          TextBackGround(Black);
          TextColor(2);
          Write('  ');
          TextColor(Red);
          Readln(Senha);
          TextBackGround(Black);
          
          If (Upcase(Senha)) = '9637ZX' then
            Begin
              GotoXY (70,8);
              TextBackGRound(BLUE);
              TextColor(LightGreen);
              Write (' V ');
              V:= 1;
              GotoXY(55,10);
              TextColor(Green);
              Writeln('Senha correta!!!');
            end
            Else
            Begin
              GotoXY (70,8);
              TextBackGround(BLUE);
              TextColor(LightRed);
              Write (' X ');
              V:=2;
              GotoXY(55,10);
              TextColor(RED);
              Writeln('Senha incorreta!!!');
            end;
            
            If V <> 1 then
            Begin
              TextBackGround(Black);
            end;
            
            Writeln;
            TextColor(Red+Blink);
            GotoXY(20,12);
            TextBackGround(LightRed);
            Textcolor(White+Blink);
            Writeln('---Press Enter---');
            TextBackGround(Black);
            Readkey;
            Clrscr;
        end;
          
          Case V of
            1:
            Begin
              Armazem;
            end
            else
            Begin
              V:= 99;
            end;
            
            
      End;
          
    End.