// Taula per la generacio dels caracters utilitzant un font 5x7 pixels
// A la taula estan els caracters ASCII del 32 al 125
// A les posicions posteriors hi ha simbol no estandard ASCII
 
unsigned const char font5x7[500] = {
	
//CAP
	0x0F, 0x17, 0x1F, 0x17, 0x0F, 		// 0
	// <- (esq)	
	0x3E, 0x3E, 0x3E, 0x2A, 0x1C, 		// 5
	// v  (baix)
	0x78, 0x74, 0x7C, 0x74, 0x78, 		// 10
	// -> (dreta) 
	0x1C, 0x2A, 0x3E, 0x3E, 0x3E, 		// 15
	// ^  (dalt)


//COS
	0x00, 0x7F, 0x7F, 0x7F, 0x00, 		// 20
	// ------
	0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 		// 25
	// |
	// |


//GIRAR
	0x00, 0x7C, 0x7C, 0x7C, 0x1C, 		// 30
	// ___ 
	//    |
	
	0x00, 0x1F, 0x1F, 0x1F, 0x1C, 		// 35
	//  ___ 
	// |   
	
	0x1C, 0x7C, 0x7C, 0x7C, 0x00, 		// 40
	//.   |
	// ----    
	
	0x1C, 0x1F, 0x1F, 0x1F, 0x00, 		// 45
	// |
	// ----   


//APPLE
	0x08, 0x1C, 0x3A, 0x3E, 0x1C, 		// 50

//BARRERA
	0x55, 0x55, 0x55, 0x55, 0x55 		// 55
};



