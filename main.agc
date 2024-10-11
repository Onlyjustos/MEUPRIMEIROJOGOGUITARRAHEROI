


 //mostra as hitbox

#include "funcoesnotas.agc" //inclui os outros arquivos nesse codigo
#insert "tela.agc" 





menuImg = loadimage ("GUITARRAHEROIMENU.png")
menuSP = CreateSprite(menuIMG)
setspritesize(menuIMG,1024,768)
SetSpriteDepth(menusp,1)

createsprite(LoadImageResized("fundo provisorio kkk.png",4,3.2,0))  //background do jogo
botao1IMG=loadimage("botaostart.png")   //botao que começa o jogo
botao1=CreateSprite(0)
setspritesize(botao1,400,130)
SetSpritePosition (botao1,320,275)
SetSpriteDepth(botao1,10)
SetSpriteColor(botao1,0,0,0,255)


LoadImage (1,"verde.png")   //imagens das sprites 
LoadImage (2,"vermelho.png")
loadimage (3,"amarelo.png")
loadimage (4,"azul.png")
loadimage (5,"laranja2.png")

loadimage (6,"camada 11.png")
loadimage (7,"camada 2.png")
loadimage (8,"camada 31.png")
loadimage (9,"camada 32.png")
loadimage (10,"camada 42.png")
LoadImage (11,"rastroverde.png")
LoadImage (12,"rastroVermelho.png")
LoadImage (13,"rastroAzul3.png")
LoadImage (14,"rastroAmar.png")
LoadImage (15,"rastroLar.png")
LoadImage (16,"camada 16.png")
LoadImage (17,"camada 17.png")
LoadImage (18,"camada 18.png")
LoadImage (19,"camada 19.png")


//musicas
LoadMusic (10,"courtesycringe.mp3")

TYPE Notas      //struct que engloba todas as notas, criando uma lei para todo tipo
	X 
	Y 	
	spriteid
	tamanho	
	speed 
	color
ENDTYPE
TYPE rastro     //struct que engloba todos os rastros, criando uma lei para todo tipo
	X 
	Y 	
	spriteid
	tamanho	
	speed 
	color
ENDTYPE
dim rastroAtivos[] as rastro
dim notasAtivas[] as notas 
//-----------------------sprites-----------------------------
	
	
//torna a imagem um sprite
botaoverde = CreateSprite ( 6 )
botaoVermelho = CreateSprite( 7 )	
botaoAmarelo = CreateSprite( 8 )
botaoAzul = CreateSprite( 9 )
botaoLaranja = CreateSprite( 10 )
SetSpritePosition (botaoVermelho,450,670)		
SetSpritePosition (botaoVerde,310,670)		
SetSpritePosition (botaoAmarelo,580,670)		
SetSpritePosition (botaoAzul,720,670)
SetSpritePosition (botaolaranja,857,670)

SetSpriteDepth(botaovermelho,2)
SetSpriteDepth(botaoverde,2)
SetSpriteDepth(botaoamarelo,2)
SetSpriteDepth(botaoazul,2)
SetSpriteDepth(botaolaranja,2)
//aumenta o tamanho
setspritesize(botaoVermelho,100,100)
setspritesize(botaoVerde,100,100)
setspritesize(botaoAmarelo,100,100)
setspritesize(botaoAzul,100,100)
setspritesize(botaolaranja,100,100)


	

//variveis de controle
  
global  score as float = 10    //incrementa a pontuacao
global  pontuacao as float= 0	//pontuacao a ser mostrada
global 	bonus as float  = 1.0	//multiplicador do incremento de pontuacao
global  hp = 0  // vida
segundoatual as integer[5] 
valordosegundoatual#= -1
atualizouosegundo = 1 //1 para verdade, 0 para falso
bonusreal  = 1
menu = 1
tempodomenu = 0
mouse = createsprite(0)
global segundoatualI = 0
SetSpriteVisible(mouse,0)

do	
	
	if(menu = 1)
		
		gosub menuprincipal
		gosub marcamelhorscore
		gosub pegamelhorscore           
	endif
		
	if(menu = 0)
		if(GetRawKeyPressed(27))
			StopMusic()
			segundoatualI=0
			menu=1
				
		endif
		gosub revelasprite
		gosub escondespritemenu
		gosub criaNotas
		gosub moveNotas
		gosub escrevescore
		
	endif	

Sync()
loop

return

menuprincipal:
	gosub escondesprite
	gosub mouseposicao
	
	SetSpriteVisible(menuSP,1)
	SetSpriteVisible(botao1,1)
	
	tempodomenu = Getseconds()
	
	if(GetPointerPressed()and GetSpriteCollision(botao1,mouse))
		gosub escondespritemenu
		menu = 0
			
	endif
	

	
	
return	

mouseposicao:
		SetSpritePosition(mouse,GetPointerX(),GetPointerY())
return

escrevescore: //imprime a pontuacao
	printc("pontuacao:")	
	print( pontuacao )    
	printc("bonus: ")
	printc( bonusreal )      
	print("x")
	printc("melhor score:")
	print(melhorscore)
return
melhorscore=0

marcamelhorscore:
	if(pontuacao>melhorscore)
		melhorscore = pontuacao
		OpenToWrite (1,"melhorpontuacao.txt",0)
		WriteInteger(1, melhorscore)
		CloseFile(1)
	endif
	
	printc("melhor score:")
	print(melhorscore)
return


escondesprite:
		SetSpriteVisible (botaoVermelho,0)		
		SetSpriteVisible (botaoVerde,0)		
		SetSpritevisible (botaoAmarelo,0)		
		SetSpriteVisible (botaoAzul,0)
		SetSpriteVisible (botaolaranja,0)
		
		
		
return
escondespritemenu:
		SetSpriteVisible (botao1,0)		
				
		SetSpriteVisible (menusp,0)
		
		SetSpriteVisible (botao1,0)
return		
revelasprite:
	
	SetSpriteVisible (botaoVermelho,1)		
	SetSpriteVisible (botaoVerde,1)		
	SetSpritevisible (botaoAmarelo,1)		
	SetSpriteVisible (botaoAzul,1)
	SetSpriteVisible (botaolaranja,1)
	setspritesize(botaoVermelho,100,100)
	setspritesize(botaoVerde,100,100)
	setspritesize(botaoAmarelo,100,100)
	setspritesize(botaoAzul,100,100)
	setspritesize(botaolaranja,100,100)
	SetSpritePosition (botaoVermelho,450,670)		
	SetSpritePosition (botaoVerde,310,670)		
	SetSpritePosition (botaoAmarelo,580,670)		
	SetSpritePosition (botaoAzul,720,670)
	SetSpritePosition (botaolaranja,857,670)
	
	

return


pegamelhorscore:
	if(GetFileExists("melhorpontuacao.txt")=1)
		OpenToRead (1,"melhorpontuacao.txt")
			melhorscore = ReadInteger(1)
		CloseFile(1)
	endif
return
