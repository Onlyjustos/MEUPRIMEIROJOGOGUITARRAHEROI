
criaNotas:         //funciona como um timer para quando vai lançar a proxima linha de notas
					//favor nao alterar
		print(segundoatualI)
		if (valordosegundoatual < GetMilliseconds())
			atualizouosegundo = 0
			segundoatualI = segundoatualI + 1
			valordosegundoatual = GetMilliseconds() + 90
		endif 
		
		if(Getseconds()=2+tempodomenu)	//começa o jogo
			PlayMusic(10)
		endif
		if(GetSeconds()=91) //acaba o jogo
			StopMusic()
			menu=1
			
			
		endif
		
	   
	    
		if(atualizouosegundo = 0 )
			segundoatual=segundos[segundoatualI]
			if(segundoatual[0]=1)
				criaverde()
			endif
			
			if(segundoatual[1]=1)
				criavermelho()
			endif
			
			if(segundoatual[2]=1)
				criaamarelo()
			endif
			if(segundoatual[3]=1)
				criaazul()
			endif
			if(segundoatual[4]=1)
				crialaranja()
				
			endif
			if(segundoatual[0]=2)
				criarastroverde()
			endif
			
			if(segundoatual[1]=2)
				criarastrovermelho()
			endif
			
			if(segundoatual[2]=2)
				criarastroamarelo()
				
				
			endif
			if(segundoatual[3]=2)
				criarastroAzul()
				
			endif
			if(segundoatual[4]=2)
				criarastrolaranja()
				
			endif
			
			
			atualizouosegundo = 1
			
		endif
		
return



function criaverde()
	nota as notas
	nota.x = 328
	nota.speed = 10
	nota.y = -20
	nota.spriteid = CreateSprite(1)
	SetSpriteSize (nota.spriteid,70,40)
	SetSpriteShapeCircle(nota.spriteid,1,1,40)
	SetSpritePosition(nota.spriteid, nota.x, nota.y)
	SetSpriteDepth(nota.spriteid,2)
	notasAtivas.Insert(nota)
endfunction

function criarastroverde()
	verde as rastro
	verde.x=330
	verde.y=-80
	verde.speed = 10
	verde.tamanho = 125
	verde.spriteid = CreateSprite(11)
	SetSpriteSize (verde.spriteid,40,verde.tamanho)
	SetSpriteDepth(verde.spriteid,2)
	SetSpritePosition(verde.spriteid, verde.x, verde.y)
	rastroAtivos.Insert(verde)
	
endfunction

function criavermelho()
	nota as notas
	nota.x=470
	nota.y=-20
	nota.speed = 10
	nota.spriteid = CreateSprite(2)
	SetSpriteSize (nota.spriteid,70,40)
	SetSpriteShapeCircle(nota.spriteid,1,1,40)
	SetSpriteDepth(nota.spriteid,2)
	SetSpritePosition(nota.spriteid, nota.x, nota.y)
	
	notasAtivas.Insert(nota)
endfunction

function criarastrovermelho()
	vermelho as rastro
	vermelho.x=480
	vermelho.y=-80
	vermelho.speed = 10
	vermelho.tamanho = 125
	vermelho.spriteid = CreateSprite(12)
	SetSpriteSize (vermelho.spriteid,40,vermelho.tamanho)
	SetSpriteDepth(vermelho.spriteid,2)
	SetSpritePosition(vermelho.spriteid, vermelho.x, vermelho.y)
	rastroAtivos.Insert(vermelho)
	
endfunction

function criaamarelo()
	nota as notas
	nota.x=600
	nota.y=-20
	nota.speed = 10

	nota.spriteid = CreateSprite(3)
	SetSpriteSize (nota.spriteid,70,40)
	SetSpriteShapeCircle(nota.spriteid,1,1,40)
	SetSpriteDepth(nota.spriteid,2)
	SetSpritePosition(nota.spriteid, nota.x, nota.y)
	
	notasAtivas.Insert(nota)
endfunction

function criarastroamarelo()
	amarelo as rastro
	amarelo.x=620
	amarelo.y=-80
	amarelo.speed = 10
	amarelo.tamanho = 125
	amarelo.spriteid = CreateSprite(14)
	SetSpriteSize (amarelo.spriteid,40,amarelo.tamanho)
	SetSpriteDepth(amarelo.spriteid,2)
	SetSpritePosition(amarelo.spriteid, amarelo.x, amarelo.y)
	rastroAtivos.Insert(amarelo)
	
endfunction

function criaazul()
	nota as notas
	nota.x=745
	nota.y=-20
	nota.speed = 10

	nota.spriteid = CreateSprite(4)
	SetSpriteSize (nota.spriteid,70,40)
	SetSpriteShapeCircle(nota.spriteid,1,1,40)
	SetSpriteDepth(nota.spriteid,2)
	SetSpritePosition(nota.spriteid, nota.x, nota.y)
	
	notasAtivas.Insert(nota)
endfunction

function criarastroAzul()
	azul as rastro
	azul.x=765
	azul.y=-80
	azul.speed = 10
	azul.tamanho = 125
	azul.spriteid = CreateSprite(13)
	SetSpriteSize (azul.spriteid,40,azul.tamanho)
	SetSpriteDepth(azul.spriteid,2)
	SetSpritePosition(azul.spriteid, azul.x, azul.y)
	rastroAtivos.Insert(azul)
	
endfunction

function crialaranja()
	nota as notas
	nota.x=885
	nota.y=-20
	nota.speed = 10

	nota.spriteid = CreateSprite(5)
	SetSpriteSize (nota.spriteid,70,40)
	SetSpriteShapeCircle(nota.spriteid,1,1,40)
	SetSpriteDepth(nota.spriteid,2)
	SetSpritePosition(nota.spriteid, nota.x, nota.y)
	
	notasAtivas.Insert(nota)
endfunction

function criarastrolaranja()
	laranja as rastro
	laranja.x=885
	laranja.y=-80
	laranja.speed = 10
	laranja.tamanho = 125
	laranja.spriteid = CreateSprite(14)
	SetSpriteSize (laranja.spriteid,40,laranja.tamanho)
	SetSpriteDepth(laranja.spriteid,2)
	SetSpritePosition(laranja.spriteid, laranja.x, laranja.y)
	rastroAtivos.Insert(laranja)
	
endfunction

acertouNota:     //analisa se o clique acertou ou nao uma nota vermelha
	
	if(GetSpriteExists(notasAtivas[i].spriteID))
		if (GetRawKeypressed(65)) //analisa se o clique acertou ou nao uma nota verde																													
			if (GetSpriteCollision ( botaoVerde , notasAtivas[i].spriteID ))
				gosub marcascore	
				DeleteSprite(notasAtivas[i].spriteID)  
			endif
		endif
	endif
	
	if(GetSpriteExists(notasAtivas[i].spriteID))	
		if (GetRawKeypressed(83))
			if (GetSpriteCollision ( botaoVermelho , notasAtivas[i].spriteid ))
				gosub marcascore	
				DeleteSprite(notasAtivas[i].spriteID)			//deleta a sprite que foi tocada
			endif
		endif
	endif
	
	
	if(GetSpriteExists(notasAtivas[i].spriteID))	
		if (GetRawKeypressed(74))	//analisa se o clique acertou ou nao uma nota amarela
			if (GetSpriteCollision ( botaoAmarelo , notasAtivas[i].spriteid ))
				gosub marcascore		
				DeleteSprite(notasAtivas[i].spriteID)   	
					
			endif
		endif
	endif
		
	if(GetSpriteExists(notasAtivas[i].spriteID))		
		if (GetRawKeyPressed(75))	 //analisa se o clique acertou ou nao uma nota azul
			if (GetSpriteCollision ( botaoazul, notasAtivas[i].spriteid ))
				gosub marcascore	
					
				DeleteSprite(notasAtivas[i].spriteID) //deleta a sprite que foi tocada
					
			endif
		endif
	endif

	if(GetSpriteExists(notasAtivas[i].spriteID))		
		if (GetRawKeyPressed(76))	 //analisa se o clique acertou ou nao uma nota laranja
				if (GetSpriteCollision (botaolaranja, notasAtivas[i].spriteid ))
					gosub marcascore	
					
					DeleteSprite(notasAtivas[i].spriteID) //deleta a sprite que foi tocada
					
				endif
		endif
	endif
return


//move todas as notas ate acabar o tamanho da array de struct
moveNotas:
	for i = 0 to notasAtivas.length
		if(GetSpriteExists(notasAtivas[i].spriteID))
			SetSpritePosition (notasAtivas[i].spriteid, notasAtivas[i].X,notasAtivas[i].Y)
			notasAtivas[i].Y = notasAtivas[i].Y + notasAtivas[i].speed 
			gosub perdeuNota
			gosub acertouNota

		endif		
	next i
	//move todos os rastros ate acabar o tamanho da array de struct
	for i = 0 to rastroAtivos.length
	if(GetSpriteExists(rastroAtivos[i].spriteID))
		SetSpritePosition(rastroAtivos[i].spriteid, rastroAtivos[i].X,rastroAtivos[i].Y)
		rastroAtivos[i].Y = rastroAtivos[i].Y + rastroAtivos[i].speed 
		
		gosub deletarastro
			
	endif
		
	next i
return
//deleta os rastros quando pressionado
deletarastro:
	
	if(rastroAtivos[i].y>560 and rastroAtivos[i].X=330 and rastroAtivos[i].tamanho>0 and rastroAtivos[i].y>-10)             //verifica se o rastro ta no alcance do botao verde
			if( GetRawKeyState(65))
					
				rastroAtivos[i].tamanho = rastroAtivos[i].tamanho-10
				SetSpriteSize(rastroAtivos[i].spriteid,40,rastroAtivos[i].tamanho)	
				
				
			endif
			if(rastroAtivos[i].tamanho<0)
				DeleteSprite(rastroAtivos[i].spriteid)
			
			endif		
	endif
	
	if(rastroAtivos[i].y>570 and rastroAtivos[i].X=480 and rastroAtivos[i].tamanho>0 and rastroAtivos[i].y>-10)				 //verifica se o rastro ta no alcance do botao vermelho				
			if ( GetRawKeyState(83))	
				rastroAtivos[i].tamanho = rastroAtivos[i].tamanho-10
				SetSpriteSize(rastroAtivos[i].spriteid,40,rastroAtivos[i].tamanho)					
			endif
			if(rastroAtivos[i].tamanho<0)
				DeleteSprite(rastroAtivos[i].spriteid)
			endif		
	endif
	
	if(rastroAtivos[i].y>570 and rastroAtivos[i].X=620 and rastroAtivos[i].tamanho>0 and rastroAtivos[i].y>-10)					 //verifica se o rastro ta no alcance do botao amarelo
			if ( GetRawKeyState(74))
				rastroAtivos[i].tamanho = rastroAtivos[i].tamanho-10
				SetSpriteSize(rastroAtivos[i].spriteid,40,rastroAtivos[i].tamanho)	
			endif
			if(rastroAtivos[i].tamanho<0)
				DeleteSprite(rastroAtivos[i].spriteid)
			endif			
	endif
	
	if(rastroAtivos[i].y>570 and rastroAtivos[i].X=765 and rastroAtivos[i].tamanho>0 and rastroAtivos[i].y>-10)				 //verifica se o rastro ta no alcance do botao azul
			if ( GetRawKeyState(75))
				rastroAtivos[i].tamanho = rastroAtivos[i].tamanho-10
				SetSpriteSize(rastroAtivos[i].spriteid,40,rastroAtivos[i].tamanho)			
			endif
			if(rastroAtivos[i].tamanho<0)
				DeleteSprite(rastroAtivos[i].spriteid)
			endif			
	endif
	
	if(rastroAtivos[i].y>570 and rastroAtivos[i].X=885 and rastroAtivos[i].tamanho>0 and rastroAtivos[i].y>-10)				 //verifica se o rastro ta no alcance do botao laranja
			if ( GetRawKeyState(76))
				rastroAtivos[i].tamanho = rastroAtivos[i].tamanho-10
				SetSpriteSize(rastroAtivos[i].spriteid,40,rastroAtivos[i].tamanho)	
				
			endif
			if(rastroAtivos[i].tamanho<0)
				DeleteSprite(rastroAtivos[i].spriteid)
			endif			
	endif
	
perdeuNota: //pune a perda de nota e deleta ela
	
	if (GetSpriteExists(notasAtivas[i].spriteid ) and notasAtivas[i].Y > 768)

		bonusreal=1
		bonus=1
		DeleteSprite(notasAtivas[i].spriteID)
	
			
		
	endif	
	
return

marcascore:   
	
	pontuacao = pontuacao + score * bonusreal
	
	bonus = bonus+0.1		
	
	if(bonus>0.9)
		bonusreal=1
	endif	
	if(bonus>1.9)
		bonusreal=2
	endif	
	if(bonus>2.9)
		bonusreal=3
	endif	
	if(bonus>3.9)
		bonusreal=4
	endif	
return

