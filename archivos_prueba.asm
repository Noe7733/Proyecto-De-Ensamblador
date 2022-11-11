
include macrosProyecto.txt ;Importacion del archivo (.txt) que contiene las macros a emplear

SGPILA SEGMENT PARA STACK 'PILA'
    
SGPILA ENDS 

;Inicio del segmento de datos
DATA SEGMENT

    ;variables para el funcionamiento del menu
    CADE DB " BIENVENIDO AL MENU PRINCIPAL:) ",0DH, 0AH, "$"
    CADE2 DB "0.- Hoja de presentacion :D", 0DH, 0AH, " 1.- Comparaciones de numeros", 0DH, 0AH, " 2.- Operaciones con archivos", 0DH, 0AH," 3.- Bota navidenia", 0DH, 0AH, " 4.- Salir",0DH, 0AH,"$"
    cadePedirNumIndice DB " Ingresar de favor la opcion deseada: $" ;Es para guardar datos
    numIndice DB 0;Se le da un valor de cero, porque guarda el valor ingresado por teclado
    
    ;cadenas para el submenu
    cadeSub0 DB 'Que desea hacer? $'
    cadeSub1 DB '1.- Retroceder $'
    cadeSub2 db '2.- Salir $'
    cadePedSub DB 'R= $'
    cadeNumSub DB 0
    
    ;variables para la impresion del mensajes de error
    cadeError DB "Opcion digitada incorrecta", 0DH, 0AH, "$"
    cadeError2 DB "Digitar de nuevo, de favor", 0DH, 0AH, "$"   
    
    ;variables para el funcionamineto de la opcion1 comparaion de dos digito
    CADE3 DB 'Ingresa el primer digito: $'
    CADE4 DB 'Ingresa el segundo digito: $' 
    mensaje1 db 13,10, 'El numero 1 es mayor que el numero 2! $'
    mensaje2 db 13,10, 'El numero 1 es menor que numero 2!$'
    mensaje3 db 13,10, 'Los numeros son iguales!$'
    num1 DB ?
    num2 DB ?
       
    ;variables del submenu 2 en comparacion de numeros
    Titulo DB "***Comparacion de dos numeros***$"
    QUEDARSE DB 'Volver a comparar digitos(s)',10,13,'$'
    EXIT DB 'Regresar al menu principal(d)',10,13,'$'
    PREGUNTA DB 'Elegir una de las siguientes opciones:',10, 13,'$'
    RESPUESTA DB 'R= $' 
    V1 DB ? 
          
   
    ;cadenas para el menu de archivos
    cadeArchi0 DB "Menu de archivos xD", 0DH, 0AH,"$" 
    cadeArchi1 DB "1.- Creacion de un archivo.", 0DH, 0AH, "$"
    cadeArchi2 DB "2.- Lectura de un archivo.", 0DH, 0AH, "$"
    cadeArchi3 DB "3.- Escritura de un archivo.", 0DH, 0AH, "$"
    cadeArchi4 DB "4.- Eliminacion de un archivo.", 0DH, 0AH, "$"
    cadeResArchi DB "Ingresar de favor la opcion deseada: $"
    numArchi DB 0
    cadeArchi5 DB "Creacion Existosa!!", 0DH, 0AH, "$"
    cadeArchi6 DB "Lectura Existosa!!", 0DH, 0AH, "$"
    cadeArchi7 DB "Escritura Existosa!!", 0DH, 0AH, "$"
    cadeArchi8 DB "Eliminacion Existosa!!", 0DH, 0AH, "$"
    cadeArchi9 DB "5.- Regresar al menu principal***", 0DH, 0AH, "$"  
    cadeArchi10 DB "Ingresa el nombre del archivo: $"   
    cadeArchi11 DB "Desea realizar la misma opcion?", 0DH, 0AH,"$"
    cadeArchi12 DB "Si (s)", 0DH, 0AH,"$"
    cadeArchi13 DB "Regresar (r)", 0DH, 0AH,"$"    
    cadeArchi14 DB "Ingresa el contenido del archivo:$"
    cadeCancelada DB "Operacion Cancelada", 0DH, 0AH, "$" 
    cadeArchi15 DB "Ingresar el nombre con.txt ejemplo:(nombre.txt)$"  
    cadeArchi16 DB "Ingresar el nombre con el que fue creado en la op.1", 0DH, 0AH,"$"  
   
    
    
     
    ;mensajes y variables que se utilizan en las operaciones con archivos  
    ruta DB 'C',':','\','$',00H; Especifica la ruta en donde estara archivo
    nombre DB 30d dup('$')  ; se le asignan solo 13 caracteres en la cadena
    handle DW 0D; variable para registros  y que no se pierdan los registros
    aux DW  0d ;variable para auxiliar los registros
    vec DB 50d dup('$') ;guarda lo que se va a escribir en un archivo   
    des1 DB "Seguro de realizar este cambio s/n?: $"
    contenidoArchi DB "Contenido: $"
    opc DB 0
    letraAr DB ?
    
    
    ;Cadena de mensaje para el pino de navidad
    Mensaje4 db 'Bota de navidad $' 
    Mensaje5 db 'Feliz navidad y $' 
    Mensaje6 db 'Prospero anio nuevo $'
    Mensaje7 db '2023 $'
    Mensaje8 db '*   *   *   *   *   *   *   *   *   *   *   *   *   *   * $'     
    Aum DB 0D
    
    ;cadenas para la hoja de presentacion
    CadeP1 DB "Univerisidad Autonoma de Chiapas$"
    CadeP2 DB "Campus IV$"    
    CadeP3 DB "Traductores de bajo nivel$"
    CadeP4 DB "Proyecto Final$"   
    CadeP5 DB "5-D$" 
    CadeP6 DB "Integrantes:$"
    CadeP7 DB "Paola Jadziry Culebro Ovando$"
    CadeP8 DB "Alejandro Gomez Alvarado$"
    CadeP9 DB "Noe Guillen Gerardo$"
    CadeP10 DB "Alvaro Najera Verdugo$"  
    CadeP11 DB "Jeannette Sanchez Hernandez$"
  
DATA ENDS
;Fin del segmento de datos

;Inicio del segmento de codigo
CODE SEGMENT
    
    ASSUME DS:DATA, CS: CODE ;Assume = asume que es el segmento de datos es "DATA"
                             ; y el segmento de codigo es "CODE"

    INICIO:
    ;Inicio del segmento prefijo del programa
    MOV AX, DATA
    MOV DS, AX
    ;Fin del segmento prefijo del programa
    
    ;Etiqueta para la seccion del menu principal
    Menu_principal:   
        macroColor 01101111B, 00D, 00D, 25D, 79D
        macroPosiciones 01D, 21D, CADE
        macroPosiciones 04D, 01D, CADE2
        macroPedirDatos 09d, 00D, cadePedirNumIndice, numIndice ;Imprime la cadena en una poscion establecida y luego pide un dato por teclado
        JMP Comparaciones_principales
    
    ;Etiqueta para la seccion de comparaciones_principales
    Comparaciones_principales:   
    
        CMP numIndice, 0D ;Compara lo que contenga numIndice con 0D
        JE Hoja_presentacion ;Salta a la etiqueta Opcion_incorrecta
        CMP numIndice, 1D ;Compara lo que contenga numIndice con 1D
        JE Comparaciones_numeros ;Salta a la etiqueta Comparaciones_numeros
        CMP numIndice, 2D ;Compara lo que contenga numIndice con 2D
        JE Operaciones_archivos ;Salta a la etiqueta Operaciones_archivos
        CMP numIndice, 3D ;Compara lo que contenga numIndice con 3D
        JE Bota_navidenia ;Salta a la etiqueta Bota_navidenia
        CMP numIndice, 4D ;Compara lo que contenga numIndice con 4D
        JE Salir          ;Salta a la etiqueta Salir
        CMP numIndice, 5D ;Compara lo que contenga numIndice con 5D
        JE Opcion_incorrecta ;Salta a la etiqueta Opcion_incorrecta
        CMP numIndice, 6D ;Compara lo que contenga numIndice con 6D
        JE Opcion_incorrecta ;Salta a la etiqueta Opcion_incorrecta
        CMP numIndice, 7D ;Compara lo que contenga numIndice con 7D
        JE Opcion_incorrecta ;Salta a la etiqueta Opcion_incorrecta
        CMP numIndice, 8D ;Compara lo que contenga numIndice con 8D
        JE Opcion_incorrecta ;Salta a la etiqueta Opcion_incorrecta
        CMP numIndice, 9D ;Compara lo que contenga numIndice con 9D 
        JE Opcion_incorrecta ;Salta a la etiqueta Opcion_incorrecta
    ;Comparaciones_secundarias:
    Comparaciones_secundarias:   
    
        CMP cadeNumSub, 0D ;Compara lo que contenga cadeNumSub con 0D    
        JE Opcion_incorrecta ;Salta a la etiqueta Opcion_incorrecta
        CMP cadeNumSub, 1D ;Compara lo que contenga cadeNumSub con 1D
        macroClear
        macroColor 00001111B, 00D, 00D, 25D, 79D
        JE Menu_principal ;Salta a la etiqueta Menu_principal
        CMP cadeNumSub, 2D ;Compara lo que contenga cadeNumSub con 2D
        JE Salir           ;Salta a la etiqueta Salir
        CMP cadeNumSub, 3D ;Compara lo que contenga cadeNumSub con 3D
        JE Opcion_incorrecta ;Salta a la etiqueta Opcion_incorrecta
        CMP cadeNumSub, 4D ;Compara lo que contenga cadeNumSub con 4D
        JE Opcion_incorrecta ;Salta a la etiqueta Opcion_incorrecta
        CMP cadeNumSub, 5D ;Compara lo que contenga cadeNumSub con 5D
        JE Opcion_incorrecta ;Salta a la etiqueta Opcion_incorrecta
        CMP cadeNumSub, 6D ;Compara lo que contenga cadeNumSub con 6D
        JE Opcion_incorrecta ;Salta a la etiqueta Opcion_incorrecta
        CMP cadeNumSub, 7D ;Compara lo que contenga cadeNumSub con 7D
        JE Opcion_incorrecta ;Salta a la etiqueta Opcion_incorrecta
        CMP cadeNumSub, 8D ;Compara lo que contenga cadeNumSub con 8D
        JE Opcion_incorrecta ;Salta a la etiqueta Opcion_incorrecta
        CMP cadeNumSub, 9D ;Compara lo que contenga cadeNumSub con 9D
        JE Opcion_incorrecta ;Salta a la etiqueta Opcion_incorrecta

    ;Comparaciones de archivos
    CMP_Archivos:
        CMP numArchi, 0D
        JE Opcion_incorrecta
        CMP numArchi, 1D
        JE Create_file
        CMP numArchi, 2D
        JE Read_file
        CMP numArchi, 3D
        JE Update_file
        CMP numArchi, 4D
        JE Delete_file
        CMP numArchi, 5D
        JE  Menu_principal
        CMP numArchi, 6D
        JE Opcion_incorrecta
        CMP numArchi, 7D
        JE Opcion_incorrecta
        CMP numArchi, 8D
        JE Opcion_incorrecta
        CMP numArchi, 9D
        JE Opcion_incorrecta 
        JMP Submenu
        
    ;Etiqueta para la seccion de las comparaciones de los numeros
    Comparaciones_numeros: 
        macroClear  
        macroColor 01101111B, 00D, 00D, 25D, 79D;pinta el fondo de color cafe  
        macroPosiciones 01D, 21D, Titulo;Titulo   
        macroPedirDatos 04D, 02D, cade3, num1; pide el numero 1
        macroPedirDatos 05D, 02D, cade4, num2 ;pide el numero 2      
        CMP num1,al  ;compara el numero
        JA EsMayor  ; es mayor  el num 1
        JB EsMenor   ;es menor el num2
        JE EsIgual  ;son iguales
            
    EsMayor:  
        
        mov ah,09h
        lea dx,mensaje1
        int 21h  
        jmp Submenu2 
        
    EsMenor:
        
        mov ah,09h
        lea dx,mensaje2
        int 21h  
        jmp Submenu2 
                 
    EsIgual:
        
        mov ah,09h
        lea dx,mensaje3
        int 21h 
        jmp Submenu2 
          
    Submenu2:
        macroPosiciones 11D, 02D, quedarse
        macroPosiciones 12D, 02D, exit   
        macroPosiciones 10d, 02d, PREGUNTA
        PedirLetraM 13D, 02D, RESPUESTA, V1
        CMP V1,73H; S EN CODIGO ASCI
        JE  Comparaciones_numeros
        CMP V1,64H;valor de d en codigo ASCI  
        JE  Menu_principal
        
    ;Etiqueta para la seccion de las operaciones con archivos 
    Operaciones_archivos:   
        macroClear
        macroColor 01101111B, 00D, 00D, 25D, 79D
        macroPosiciones 00D, 25D, cadeArchi0
        macroPosiciones 02D, 00D, cadeArchi1
        macroPosiciones 03D, 00D, cadeArchi2
        macroPosiciones 04D, 00D, cadeArchi3
        macroPosiciones 05D, 00D, cadeArchi4 
        macroPosiciones 06D, 00D, cadeArchi9
        macroPedirDatos 08D, 00D, cadeResArchi, numArchi
        JMP CMP_Archivos
        
        ;Etiqueta para la opcion de crear un archivo
        Create_file: 
            macroClear
            macroColor 01101111B, 00D, 00D, 25D, 79D 
            macroPosiciones 03D,04D, cadeArchi15 
            macroPosiciones 05D,04D ,cadeArchi10
              
            CALL CICLOP ; forma de llamar al procedimiento
                        
            MOV AH,3CH ;llamamos a la funcion de crear archivo
            MOV CX, 0  ;0
            MOV DX, OFFSET ruta; le asignamos la ruta en donde se va a crear
            INT 21H              
            MOV handle,ax
            macroCierreArchi
            macroPosiciones 07D,04D ,cadeArchi5 
            macroSubArchi Create_file
        
        ;Etiqueta para la opcion de leer un archivo
        Read_file: 
            macroClear
            macroColor 01101111B, 00D, 00D, 25D, 79D 
            macroPosiciones 02D,00D, cadeArchi16 
            macroPosiciones 04D,00D, cadeArchi10  
            CALL CICLOP
            
            Abrir_archivo:
                ;abertura del archivo
                
                MOV AH, 3DH;FUNCION PARA ABRIR EL ARCHIVO
                MOV AL, 0H;INDICA QUE SE ABRIRA PARA SOLO LECTURA
                MOV DX, OFFSET ruta
                INT 21H
                MOV handle, AX
                ;lectura del archivo
                
                MOV AH, 3FH;FUNCION PARA LEER EL CONTENIDO DEL ARCHIVO
                MOV BX, handle
                MOV DX, OFFSET vec
                MOV CX, aux 
                INT 21H
                
                macroPosiciones 06D, 00D, contenidoArchi
                
                MOV AH, 09H
                MOV DX, OFFSET vec
                INT 21H
                
                ;CIERRE DEL ARCHIVO
                macroCierreArchi
                
                macroPosiciones 08D, 00D, cadeArchi6  
                macroSubArchi Read_file
        
        ;Etiqueta para la opcion de escribir un archivo
        Update_file:   
            macroClear
            macroColor 01101111B, 00D, 00D, 25D, 79D   
            macroPosiciones 04D,02D, cadeArchi14  
            MOV SI,0;0 Movemos al puntero de pila en 0
            
               Pedir:
                MOV AH, 01H
                INT 21H
                MOV vec[SI],al
                inc SI
                CMP al,0dh 
                JA Pedir
                Jb Pedir
                  
                macroPedirDatosA 06D, 02D, des1
                MOV numArchi, AL
                MOV AH, 02H
                MOV DL, 0AH
                INT 21H
                CMP numArchi, 110
                JE opcCancelada
             
               Editar:
                PUSH SI 
                macroPosiciones 08D,02D, cadeArchi16  
                macroPosiciones 10D,02D, cadeArchi10
                CALL CICLOP
                POP SI
                MOV AH, 3DH
                MOV AL, 1H
                MOV DX, OFFSET ruta
                INT 21H
                JC Salir ;si hubo error
                   
                ;parte de la escritura
                MOV BX, AX
                MOV CX, si
                MOV DX, OFFSET vec
                MOV AH, 40H
                INT 21H
                CMP CX, AX
                JNE Salir
                macroCierreArchi
                macroPosiciones 12D, 02D, cadeArchi7
                macroSubArchi Update_file
        
        ;Etiqueta para la opcion de Eliminar un archivo 
        Delete_file: 
            macroClear
            macroColor 01101111B, 00D, 00D, 25D, 79D 
            macroPosiciones 02D,02D, cadeArchi16   
            mov opc, al
            mov ah, 02h
            mov dl, 0ah
            int 21h
            
            cmp opc, 110
            je opcCancelada
            
            macroCierreArchi      
            macroPosiciones 04D, 02D, cadeArchi10
            
            CALL CICLOP
            
            mov ah, 41h;eliminar
            mov cx, 0
            mov dx, offset ruta
            int 21h
            mov handle, ax
            macroPosiciones 06D, 02D, cadeArchi8
            macroSubArchi Delete_file    
             
        ;Etiqueta de submenu de archivos
 
         
         ;Etiqueta para el ciclo utilizado en los archivos
         Ciclo_ar:
            MOV AH,01H
            INT 21H
            CMP AL,0dh   ;enter
            JE FinCiclo
            CMP SI,33
            JE FinCiclo 
             
            MOV ruta [si],al
            INC si
            JB Ciclo_ar
            
            
            FinCiclo:
                MOV ruta[si],0d
                ret ; nos mueve a donde quedamos anteriormente
            
        
    ;Etiqueta para la seccion de la bota navidenia
    Bota_navidenia: 
         macroClear  
        macroColor 01101111B, 00D, 00D, 25D, 79D 
        
        
       ;nieve callendo
       macroPosiciones 01D, 01D, mensaje8  
       macroPosiciones 03D, 01D, mensaje8
       macroPosiciones 05D, 01D, mensaje8
       macroPosiciones 07D, 01D, mensaje8
       macroPosiciones 09D, 01D, mensaje8
       macroPosiciones 11D, 01D, mensaje8
       macroPosiciones 13D, 01D, mensaje8
       
        
       ;PARA EL COLOR ROJO 
       ;se define el color, el incio de columnaI, la filaI, columnaF y la filaF             
       macroColor 01000100B, 0001D, 0020D, 2D, 20D         
       macroColor 01000100B, 0002D, 0019D, 2D, 19D  
       macroColor 01000100B, 0003D, 0021D, 3D, 21D   
      
    
       ;PARA EL COLOR ROSA
       ;se define el color, el incio de columnaI, la filaI, columnaF y la filaF    
       macroColor 11011101B, 0001D, 0022D, 1D, 22D  
       macroColor 11011101B, 0002D, 0021D, 2D, 23D   
       macroColor 11011101B, 0003D, 0020D, 3D, 20D  
       macroColor 11011101B, 0003D, 0022D, 3D, 24D  
       macroColor 11011101B, 0004D, 0019D, 4D, 24D
       macroColor 01000100B, 0004D, 0022D, 4D, 22D 
        
    
       ;PARA EL COLOR CELESTE  
       ;se define el color, el incio de columnaI, la filaI, columnaF y la filaF      
       macroColor 10111011B, 0001D, 0026D, 1D, 27D  
       macroColor 10111011B, 0001D, 0029D, 1D, 30D  
       macroColor 10111011B, 0002D, 0026D, 2D, 30D   
       macroColor 10111011B, 0003D, 0028D, 4D, 28D   
      
       ;PARA EL COLOR AZUL
       ;se define el color, el incio de columnaI, la filaI, columnaF y la filaF  
       macroColor 00010001B, 0003D, 0025D, 4D, 27D   
       macroColor 00010001B, 0003D, 0029D, 4D, 31D   
      
       ;PARA EL COLOR BLANCO 
       ;se define el color, el incio de columnaI, la filaI, columnaF y la filaF  
       macroColor 11110000B, 05D, 19D,  10D, 31D 
       macroColor 11110000B, 15D, 00D,  26D, 61D
      
     
       ;PARA EL COLOR ROJO
       ;se define el color, el incio de columnaI, la filaI, columnaF y la filaF  
       macroColor 11001100B, 0011D, 0020D, 19D, 30D   
       macroColor 11001100B, 0015D, 0019D, 23D, 19D  
       macroColor 11001100B, 0016D, 0018D, 23D, 18D 
       macroColor 11001100B, 0016D, 0017D, 23D, 17D  
       macroColor 11001100B, 0016D, 0016D, 23D, 16D  
       macroColor 11001100B, 0017D, 0015D, 22D, 15D   
       macroColor 11001100B, 0018D, 0014D, 21D, 14D   
       macroColor 11001100B, 0020D, 0020D, 20D, 29D  
       macroColor 11001100B, 0021D, 0020D, 21D, 28D  
       macroColor 11001100B, 0022D, 0020D, 22D, 27D 
       macroColor 11001100B, 0023D, 0020D, 23D, 26D    
      
       ;PARA EL COLOR VERDE
       ;se define el color, el incio de columnaI, la filaI, columnaF y la filaF  
       macroColor 10101010B, 0010D, 0029D, 10D, 31D   
       macroColor 10101010B, 0009D, 0028D, 09D, 32D  
       macroColor 10101010B, 0008D, 0027D, 08D, 29D   
       macroColor 10101010B, 0008D, 0031D, 08D, 33D   
       macroColor 10101010B, 0007D, 0027D, 07D, 28D   
       macroColor 10101010B, 0007D, 0032D, 07D, 33D  
       
       ;Unico color amarillo
       ;se define el color, el incio de columnaI, la filaI, columnaF y la filaF  
       macroColor 11101110B, 0010D, 0030D, 10D, 30D   
       
       ;Se imprime un mensaje con posicion f, c
      ; macroPosiciones 18D, 38D, mensaje4  
       macroPosiciones 19D, 37D, mensaje5  
       macroPosiciones 20D, 36D, mensaje6  
       macroPosiciones 21D, 43D, mensaje7 
                                              
       ;pino 1                                       
       macroColor 10101010B, 06D, 08D, 06D, 08D    
       macroColor 10101010B, 07D, 07D, 07D, 09D                                 
       macroColor 10101010B, 08D, 06D, 08D, 10D
       macroColor 10101010B, 09D, 05D, 09D, 11D 
       macroColor 10101010B, 10D, 04D, 10D, 12D
       macroColor 10101010B, 11D, 03D, 11D, 13D  
       
       macroColor 01000100B, 12D, 06D, 14D, 10D
       
       ;pino 2
       macroColor 10101010B, 06D, 46D, 06D, 46D    
       macroColor 10101010B, 07D, 45D, 07D, 47D                                 
       macroColor 10101010B, 08D, 44D, 08D, 48D
       macroColor 10101010B, 09D, 43D, 09D, 49D 
       macroColor 10101010B, 10D, 42D, 10D, 50D
       macroColor 10101010B, 11D, 41D, 11D, 51D  
       
       macroColor 01000100B, 12D, 44D, 14D, 48D      
       
         CALL procSubmenu0        
    
    Hoja_Presentacion: 
    
        macroColor 10110000B, 00D, 00D, 25D, 79D 
        
        macroPosiciones 02D, 07D, CadeP1 
        macroPosiciones 03D, 07D, CadeP2
        macroPosiciones 04D, 07D, CadeP3
        macroPosiciones 05D, 07D, CadeP4
        macroPosiciones 06D, 07D, CadeP5
        macroPosiciones 07D, 07D, CadeP6
        macroPosiciones 09D, 07D, CadeP7
        macroPosiciones 10D, 07D, CadeP8
        macroPosiciones 11D, 07D, CadeP9
        macroPosiciones 12D, 07D, CadeP10
        macroPosiciones 13D, 07D, CadeP11    
        
        ; macroColor 10111011B, 14D, 45D, 24D, 79D  
    
         ;color rosa centro
         macroColor 11011101B, 19D, 56D, 24D, 68D         ;fila, columna, fila, columna
         macroColor 11011101B, 20D, 55D, 24D, 55D  
         macroColor 11011101B, 21D, 54D, 24D, 54D  
         macroColor 11011101B, 20D, 69D, 24D, 69D  
         macroColor 11011101B, 21D, 70D, 24D, 70D 
         macroColor 11011101B, 18D, 59D, 18D, 65D  
         
         ;color rojo lado derecho
         macroColor 01000100B, 24D, 53D, 24D, 53D
         macroColor 01000100B, 23D, 47D, 23D, 53D
         macroColor 01000100B, 22D, 46D, 22D, 53D
         macroColor 01000100B, 21D, 45D, 21D, 53D
         macroColor 01000100B, 20D, 45D, 20D, 54D
         macroColor 01000100B, 19D, 49D, 19D, 55D  
         macroColor 01000100B, 19D, 46D, 19D, 46D
         macroColor 01000100B, 18D, 48D, 18D, 58D
         macroColor 01000100B, 17D, 48D, 17D, 50D
         macroColor 01000100B, 17D, 52D, 17D, 55D 
         ;macroColor 01000100B, 17D, 74D, 17D, 76D
         macroColor 01000100B, 16D, 48D, 16D, 50D 
         macroColor 01000100B, 16D, 52D, 16D, 54D 
         macroColor 01000100B, 15D, 52D, 15D, 54D
         macroColor 01000100B, 15D, 49D, 15D, 49D
         macroColor 01000100B, 14D, 53D, 14D, 53D
         
         ;color rojo lado izquierdo
         macroColor 01000100B, 24D, 71D, 24D, 71D
         macroColor 01000100B, 23D, 71D, 23D, 77D
         macroColor 01000100B, 22D, 71D, 22D, 78D
         macroColor 01000100B, 21D, 71D, 21D, 79D
         macroColor 01000100B, 20D, 70D, 20D, 79D
         macroColor 01000100B, 19D, 69D, 19D, 75D  
         macroColor 01000100B, 19D, 78D, 19D, 78D
         macroColor 01000100B, 18D, 66D, 18D, 76D
         macroColor 01000100B, 17D, 59D, 17D, 65D
         macroColor 01000100B, 17D, 69D, 17D, 72D 
         macroColor 01000100B, 17D, 74D, 17D, 76D
         macroColor 01000100B, 16D, 70D, 16D, 72D 
         macroColor 01000100B, 15D, 70D, 15D, 72D 
         macroColor 01000100B, 16D, 74D, 16D, 76D
         macroColor 01000100B, 15D, 75D, 15D, 75D
         macroColor 01000100B, 14D, 71D, 14D, 71D 
         
         
         ;color rosa lado derecho
         macroColor 11011101B, 22D, 47D, 22D, 52D 
         macroColor 11011101B, 21D, 46D, 21D, 50D
         macroColor 11011101B, 20D, 46D, 20D, 46D
         macroColor 11011101B, 20D, 51D, 20D, 53D
         macroColor 11011101B, 19D, 50D, 19D, 52D
         macroColor 11011101B, 18D, 49D, 18D, 50D
         macroColor 11011101B, 18D, 54D, 18D, 55D
         macroColor 11011101B, 17D, 49D, 17D, 49D
         macroColor 11011101B, 17D, 53D, 17D, 54D
         macroColor 11011101B, 16D, 49D, 16D, 49D
         macroColor 11011101B, 15D, 53D, 16D, 53D
         
         ;color roja lado izquierdo
         macroColor 11011101B, 22D, 72D, 22D, 77D 
         macroColor 11011101B, 21D, 74D, 21D, 78D
         macroColor 11011101B, 20D, 78D, 20D, 78D
         macroColor 11011101B, 20D, 71D, 20D, 73D
         macroColor 11011101B, 19D, 71D, 19D, 74D
         macroColor 11011101B, 18D, 69D, 18D, 70D
         macroColor 11011101B, 18D, 74D, 18D, 75D
         macroColor 11011101B, 16D, 75D, 17D, 75D
         macroColor 11011101B, 17D, 70D, 17D, 71D
         ;macroColor 11011101B, 16D, 49D, 16D, 49D
         macroColor 11011101B, 15D, 71D, 16D, 71D
         
         ;color para la boca
         macroColor 01000100B, 24D, 61D, 24D, 63D
         macroColor 01000100B, 23D, 60D, 23D, 60D
         macroColor 01000100B, 23D, 64D, 23D, 64D  
         
         ;color para los ojos
         macroColor 00000000B, 21D, 57D, 22D, 58D
         macroColor 00000000B, 21D, 66D, 22D, 67D
         
        
          CALL procSubmenu1;llamada al proceso del submenu
    

    ;Etiqueta para la seccion del Submenu
    Submenu:
        macroClear
        macroColor 11110000B, 00D, 62D, 10D, 79D 
        macroPosiciones 01D, 63D, cadeSub0
        macroPosiciones 02D, 63D, cadeSub1
        macroPosiciones 03D, 63D, cadeSub2
        macroPedirDatos 04D, 63D, cadePedSub, cadeNumSub
        JMP Comparaciones_secundarias
                                                                                                                                                         
    ;Etiqueta que imprime un mensaje cuando se ingresa una opcion incorrecta en el menu y luego limpia la pantalla 
    Opcion_incorrecta:
        macroColor 00001111B, 00D, 00D, 25D, 79D 
        macroPosiciones 09D, 15D, cadeError
        macroPosiciones 10D, 15D, cadeError2
        JMP Submenu
    
    opcCancelada:
        MOV AH, 09H
        LEA DX, cadeCancelada
        INT 21H
            
    ;Etiqueta para la seccion que finalia el programa 
    Salir:   
        MOV AH, 4CH
        INT 21H
;------------------------------------------------------------------
; PROCESOS CERCANOS

;proceso que realiza la llamada al ciclo que guarda el nombre del archivo
CICLOP PROC NEAR
    MOV SI,3d;mueve el puntero a la pocision 3
    CALL Ciclo_ar ;llamamos a la etiqueta Ciclo_Ar
    RET
CICLOP ENDP 

procSubmenu0 PROC NEAR
        macroClear
        macroColor 00001111B, 00D, 62D, 25D, 79D
        macroPosiciones 01D, 63D, cadeSub0
        macroPosiciones 02D, 63D, cadeSub1
        macroPosiciones 03D, 63D, cadeSub2
        macroPedirDatos 04D, 63D, cadePedSub, cadeNumSub
        JMP Comparaciones_secundarias
procSubmenu0 ENDP

procSubmenu1 PROC NEAR
        macroClear
        macroColor 11110000B, 00D, 62D, 10D,79D
        macroPosiciones 01D, 63D, cadeSub0
        macroPosiciones 02D, 63D, cadeSub1
        macroPosiciones 03D, 63D, cadeSub2
        macroPedirDatos 04D, 63D, cadePedSub, cadeNumSub
        JMP Comparaciones_secundarias
procSubmenu1 ENDP


;--------------------------------------------------------------------
    
CODE ENDS
    END INICIO ;Fin del segemnto de codigo 
