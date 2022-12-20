      Program GaussJordan
      
      Real*8 A,M,Det,DetA,Adj,IA,Y,X
      Integer n,i,j,k,t,u,v,d,b
      Dimension A(10,10), M(10,10),Det(10,10),Adj(10,10),IA(10,10)
      Dimension Y(10), X(10)

      write(*,*)"            METODO DE GAUSS-JORDAN"
      Write(*,*)'______________________________________________________'

      Call LECTURA(n,A,Y)
      Write(*,*)'______________________________________________________'

      DetA = 1
      if (DetA.ne.0) then

         Do i = 1, n
            Do j = 1, n

              !Construyendo el M(i,j)
               u = 1
               Do k = 1, n
                  v = 0
                  Do t = 1, n
                     if (k.ne.i.AND.t.ne.j) then
                        v = v + 1
                        M(u,v) = A(k,t)
                     end if
                  end do
                  if (v.eq.n-1) then
                     u = u + 1
                  end if
               end do

               !Write Matriz del Menor M(i,j)
               d = n - 1
               !Write(*,*) ' '
               !Write(*,*) '   M(',i,',',j,') ='
               !Do k = 1, d
               !   Write(*,*) ' ',(M(k,t), t = 1, d)
               !end do

               !Determinante del M(i,j)
               if (n.gt.2) then
                  Call TSuperior(d,M,b)
               end if
               Det(i,j) = (-1)**b
               Do k = 1, n - 1
                  Det(i,j) = Det(i,j)*M(k,k)
               end do

               !Elemento (i,j) de la matriz adjunta
               Adj(i,j) = (-1)**(i + j)*Det(i,j)
               !Write(*,*) ' '
               !Write(*,*) ' Adj(',i,',',j,') =',Adj(i,j)

            end do
         end do

         !Calculando Det(A)
         Call TSuperior(n,A,b)
         DetA = (-1)**b
         Do i = 1, n
            DetA = DetA*A(i,i)
         end do
         Write(*,*) ' Det(A) =',DetA
         Write(*,*)'___________________________________________________'

         !Matriz inversa
         Do i = 1, n
            Do j = 1, n
               IA(i,j) = Adj(j,i)/DetA
            end do
         end do
         Write(*,*) ' Matriz Inversa de A'
         Do i = 1, n
            Write(*,*) (IA(i,j), j = 1, n)
         end do
         Write(*,*) '__________________________________________________'

         Do i = 1, n
            X(i) = 0
            Do j = 1, n
               X(i) = X(i) +  IA(i,j)*Y(j)
            end do
            Write(*,*) 'X(',i,') =',X(i)
         end do



      else if (DetA.eq.0) then

         Write(*,*)'___________________________________________________'
         Write(*,*) 'Por tanto el Det(A)=',DetA,' y A no tiene inversa'

      end if

      PAUSE
      END PROGRAM
      !_________________________________________________________________
      SUBROUTINE LECTURA(n,A,Y)

      Real*8 A,Y
      Dimension A(10,10),Y(10)

      Write(*,*)"Inserte la dimension de la matriz"
      Read(*,*) n

      Do while (n.le.1.or.n.gt.10)
         Read(*,*) n
      end do

      Do i=1,n
         Do j=1,n
            Write(*,*)" A(",i,",",j,") ="
            Read(*,*) A(i,j)
         end do
      end do

      Write(*,*)'______________________________________________________'

      Write(*,*) '   Matriz A'
      Do i = 1, n
         Write(*,*) ' ',(A(i,j), j = 1, n)
      end do

      Write(*,*) ' Ingresa el vector Y'
      Do i = 1, n
         Read(*,*) Y(i)
      end do

      Return
      End Subroutine

      !________________Reducci¢n a matriz triangular superior___________
      Subroutine TSuperior(d,M,b)

      Real*8 M,C,R
      Integer i,k,t,d,b
      Dimension M(10,10),C(10),R(10)

      b = 0
      Do i = 1, d - 1

         !Intercambio de renglones
         k = 0
         Do While (M(i,i).eq.0.AND.i.lt.d.AND.k.lt.d-i)
            k = k + 1
            if (M(i+k,i).ne.0) then
               Do t = 1, d
                  R(t) = M(i,t)
                  M(i,t) = M(i+k,t)
                  M(i+k,t) = R(t)
               end do
               b = b + 1
            end if
         end do

         !Vector columna
         Do k =  1, d
            C(k) = M(k,i)
         end do

         !Operaci¢n entre renglones (+)(-)
         Do k = i + 1, d
            t = 1
            Do While (C(k).ne.0.AND.t.le.d)
               M(k,t) = M(k,t) - (C(k)/C(i))*M(i,t)
               t = t + 1
            end do
         end do

         !Write Matriz Reducida
         !Write(*,*) ' '
         !Do k = 1, d
         !   Write(*,*) ' ',(M(k,t), t = 1, d)
         !end do

      end do

      Return
      End Subroutine