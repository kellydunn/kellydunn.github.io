// dynamics.pde
//
//  8 Dec 2010: Sample copied from 
//              http://processing.org/discourse/yabb2/YaBB.pl?num=1267698314
//              and ported to the Traer Processingjs library -mrn (Mike Niemi)
// 10 Dec 2010: Added a run state indicator -mrn
// 12 Dec 2010: Moved Buttons and Traer physics into separate pde files, 
//              added repulsion slider -mrn
// 17 Dec 2010: Added fps reading and a button to set frameRate(60) or frameRate(9999) -mrn
//  9 Feb 2011: Modified code to use PVector and the convenience classes, UniversalAttraction and Pulse, 
//              simplifying the Pendulums sample (renamed to dynamics.pde) considerably. -cap (Carl Pearson)

// NOTE: To run this in the Processing IDE, uncomment the first line of code in gimeMillis() and comment out the next.
//       To run this in Processing.js, comment out the first line of code in gimeMillis() and uncomment the 2nd.

int            n = 10,  
               kVal = -5;
ParticleSystem physics;

int            SOMEdelay = 300, i0 = 0, pi = -1;
boolean        justStarting = true, 
               IDE = false; // <-------- Set to true when running in the IDE. It adjusts the layout of the UI slightly.
StateButton    runStateButton;
boolean        running = true;
HScrollbar     hs1;
long           startMillis = 0, totalCycles = 0, totalMillis = 0;
PushButton     limitFrameRateButton;
int            limitingFrameRateState = 0;
UniversalAttraction  uniAtt;
PVector        perturbation = null;

void setup() 
{ 
  size(200,200);
  smooth();
  ellipseMode( CENTER );
  physics = new ParticleSystem( 1, 0.05 );
  resetModel();
  
  runStateButton       = new StateButton(-5, -5, 20, 255, 153, 0); 
  hs1                  = new HScrollbar(1, 194, 50, 10, 1); 
  limitFrameRateButton = new PushButton(IDE?105:87, IDE?1:3, IDE?92:70, IDE?13:9, "F.R. Undefined", "F.R. Limited", "F.R. Unlimited");
}

void resetModel()
{ 
  physics.clear();
  ArrayList unfixed = new ArrayList();
  for (int i=0; i<n; i++) 
    {
      Particle pend = physics.makeParticle( 1.0, width/2, 25, 0f );
      Particle anchor = physics.makeParticle( 1.0, random(10,width-10), height/2-2, 0f );
      anchor.makeFixed();
      physics.makeSpring( pend, anchor, 0.5, 0.1, 75 ); // Connects anchor to particle
      unfixed.add(pend);
    }
  uniAtt = new UniversalAttraction(kVal, 1, unfixed);
  physics.addCustomForce(uniAtt);
  
}  

void calcAttractions(float f1)
{ 
  kVal = (int)(-5 - f1 * 500.0); // want to go from -5 to -500
  uniAtt.setStrength(kVal);
}

void calcPerturbation(PVector perturbation)
{ 
  Pulse pul = new Pulse(500, 1, perturbation, 10, physics.particles );
  physics.addPulse(pul);
}

void draw() 
{ 
  i0++;
  totalCycles++;
  if (startMillis == 0)
     startMillis = millis(); 
     
  if (i0 > SOMEdelay)
    { // After a while, put our view to sleep to avoid consuming CPU cycles.
      //println("draw(): going to sleep now"); 
      running = false;
      noLoop();
    }   

  background(0);
  runStateButton.display( running?runStateButton.STATEon:runStateButton.STATEoff, // Sets the red indicator
                          SOMEdelay-i0 ); // Tempered by how many cycles until we go to sleep
  limitFrameRateButton.display(limitingFrameRateState);               
                                  
  if (hs1.update(SOMEdelay-i0)) // Sometimes the slider does not quiesce automatically when the mouse leaves it.
    {                           // The arg causes the slider to turn off its color in sync with the runStateButton.
      calcAttractions(hs1.getValue()); 
      i0 = 0; 
    } 
  
  physics.tick();
  
  hs1.display();
  fill(128,0,0);
  text("Repulsion", 4, 198);  
    
  if ( justStarting && i0>50 ) // Display this text after the 50th cycle when justStarting
    {   
      float f = 255;
      if (i0 < 100)
         f = ((float)i0-50.0)/50.0*255; // 0.0-255.0 .. fade-in the text over 50 cycles
         
      fill(f);
      text("Click on upper half to restart",  25, 40);
      text("Click on lower half to perturb",  25, 55);
      text("Move slider to change repulsion", 25, 70);  
    }   
      
  fill(255);
  
  long currMillis = millis();
  float f = ((float)totalCycles) *1000.0 / (float)(currMillis - startMillis);
  f = ((float)((int)(f*1000.0)))/1000.0; // Limit to 3 decimal places 
  text(f,     25, 12);
  text("fps", IDE?77:67, 12);
  
  stroke(255, 200);
  
  for (Iterator i = physics.springs.iterator(); i.hasNext(); ) 
    {
      Spring s = (Spring)i.next();
      Particle pend = s.getOneEnd();
      Particle anchor = s.getTheOtherEnd();
      line( pend.position.x, pend.position.y, 
            anchor.position.x, anchor.position.y );
      ellipse( anchor.position.x, anchor.position.y, 5, 5 );
      ellipse( pend.position.x, pend.position.y, 20, 20 );
    }
}

void mousePressed()
{ 
  i0 = 0;
  justStarting = false;

  if (!running) // We have just been reawakened
     startMillis = totalCycles = 0;
  
  if (hs1.over())
    { 
      running = true;
      loop();
      return;
    }  
     
  if (runStateButton.over())
    {
      running = !running;
      if (running)
         loop(); // Wake up the view
      else
          i0 = SOMEdelay; // let draw() put us to sleep
      return;  
    }    
    
  if (limitFrameRateButton.over()) // Undefined > Limited > Unlimited > Limited > ...
    {
      switch(limitingFrameRateState)
        { 
          case 0: limitingFrameRateState=1; frameRate(60); break;
          case 1: limitingFrameRateState=2; frameRate(9999); break;
          case 2: limitingFrameRateState=1; frameRate(60); break;
          default: limitingFrameRateState=2; frameRate(9999);
        }
      
      running = true;
      loop();
      return;
    }
    
  if (mouseY < height/2) 
    { // The mouse is in the upper half - do a reset
      physics.clear();
      if (perturbation != null) perturbation = null;  
      resetModel();
    }  
  else
    { // Otherwise, the mouse is in the lower half - create a new perturbation  
      perturbation = new PVector( mouseX, mouseY, 0f );
      calcPerturbation(perturbation);
    }  
  running = true;
  loop(); // Wake up the view (if not already awake)
}
