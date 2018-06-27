type rgb
     
val make_rgb : int -> int -> int -> rgb

type img

val make_img : url -> transaction img
		      
type canvas2d

val clearRect : canvas2d -> int -> int -> int -> int -> transaction unit

val fillRect : canvas2d -> int -> int -> int -> int -> transaction unit
						       
val setFillStyle : canvas2d -> rgb -> transaction unit
				      
val drawImage : canvas2d -> id -> int -> int -> int -> int -> int -> int -> int -> int -> transaction unit

val drawImage2 : canvas2d -> img -> int -> int -> int -> int -> transaction unit
											  
val getContext2d : id -> transaction canvas2d

val requestAnimationFrame : (unit -> transaction unit) -> transaction unit

val requestAnimationFrame2 : (unit -> transaction unit) -> transaction unit
							  
val canvas : bodyTag ([Width = int, Height = int] ++ boxAttrs)
	     
datatype compositeOperation =
	 DestinationOver
	     (*
dont forget to add them to canvas.js compOps dictionary

	 SourceOver
       | SourceIn
       | SourceOut
       | SourceAtop
       | DestinationOver
       | DestinationIn
       | DestinationOut
       | DestinationAtop
       | Lighter
       | Copy
       | Xor
       | Multiply
       | Screen
       | Overlay
       | Darken
       | Lighten
       | ColorDodge
       | ColorBurn
       | HardLight
       | SoftLight
       | Difference
       | Exclusion
       | Hue
       | Saturation
       | Color
       | Luminosity
*)
val setGlobalCompositeOperation : canvas2d -> compositeOperation -> transaction unit
			 
