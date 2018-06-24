type rgb
     
val make_rgb : int -> int -> int -> rgb
				    			    
type canvas2d

val fillRect : canvas2d -> int -> int -> int -> int -> transaction unit
						       
val setFillStyle : canvas2d -> rgb -> transaction unit
				      
val drawImage : canvas2d -> id -> int -> int -> int -> int -> int -> int -> int -> int -> transaction unit
											  
val getContext2d : id -> transaction canvas2d

val canvas : bodyTag ([Width = int, Height = int] ++ boxAttrs)

