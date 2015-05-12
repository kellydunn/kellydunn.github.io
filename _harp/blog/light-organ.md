# light organ

<p> When asked to play a DJ set at my friend's house party, I thought it would be great if my set could be complimented with an interesting lighting display.  I was intrigued with the notion of creating something that could "dance along" with the music I was playing. 
</p>

<p> After digging up some inspiration from older discotheque lighting devices and some work from my friend [Micah](http://misc.name), I eventually came across light organs, and decided to try my hand at making one.
</p>

<iframe src="//instagram.com/p/qyN0VezFrn/embed/" width="612" height="710" frameborder="0" scrolling="no" allowtransparency="true"></iframe>

## What is a light organ?

> A light organ is an electronic device which automatically converts an audio signal (such as music) into rhythmic light effects.
>
> *- Wikipedia*

<p> In this post, I'll describe my design, build process, and results of my light organ creation.  </p>

---

## Design

<p> The intent of this project was to create a satisfying effect that was low-cost, modular, and easy-to-make such that I could have it up-and-running for my set in only two weeks.  The unit also had to be portable and compact, as the venue was tight for space.
</p>

<p>
After a few initial design iterations, I settled on creating a single, solid, cube structure roughly 3'x3'x9" in dimensions.  The intention was that the inside of the cube would then be divided into multiple "shelves" of light that could be driven dynamically by the main line out of my mixer. 
</p>

<p>
With the aid of my friend [John Thomson](http://latentspark.com"), I was able to build a simple circuit that would drive my LED strips as intended.
</p>

---

## Materials

<p>
Below are all the materials you'll need to make my version of the light organ.  Keep in mind that having spares of each part is always a good idea.
</p>

### Light Organ Chasis:

- Ikea cabinet (Avdala version, 25" wide 40" tall)
- 1" wide [angled aluminum](http://www.homedepot.com/p/Crown-Bolt-1-in-x-96-in-Aluminum-Angle-Bar-with-1-20-in-Thick-56760/202183474) (48" long)
- 36" x 25" x 1/8" clear, frosted plexiglass.
- 4 additional 9" x 25" masonite shelves
- Spare, thin wood for creating the shelf supports, 64" x 1" cut evenly into 8 sections.
- 2 5m [Hitlights Cool White LED strips](http://www.amazon.com/HitLights-Flexible-Ribbon-Adapter-included/dp/B005GL5R56)
- 12Volts+ power supply
- Lots of High Gauge wire (beefy enough for 12Volts+ @ 2Amps)
- An enclosure to hold the circuits.  A small to medium size cardboard box will do in a pinch.

### Logic Board Circuit:

- [Teensy 3.1](https://www.pjrc.com/teensy/teensy31.html)
- [Teensy 3.1 Audio Shield](https://www.pjrc.com/store/teensy3_audio.html)

### Power Board Circuit:

- 8 [N-Channel 60V 7A Mosfets](http://www.digikey.com/product-detail/en/AOT2618L/785-1438-5-ND/3603378)
- 8 [100 Ohm Resistors](http://www.digikey.com/product-detail/en/CF14JT100R/CF14JT100RCT-ND/1830327)
- 1 [5V 1A Linear Power Regulator](http://www.digikey.com/product-detail/en/LM7805CT/LM7805CT-ND/458698)

---

## Tools

<p>
Below are all the tools I used to create my version of the light organ.  Keep in mind that these are the tools I had to my disposal, and you may wish to use other ones to complete the build.
</p>

### Light Organ Chasis:

- Power Drill with phillips head bit, a 1/4" drill bit, and a counter sink bit.
- 16 Wood screws
- 6 Flat-top screws
- Hammer
- Hacksaw

### Logic and Power Board Circuits:

- Soldering Iron
- Solder
- Jumper Wire

---

## Process

<p>
While waiting for my electrical components to arrive in the mail, I got to work on constructing the Chasis.
</p>

<p>
The first step was to build the Ikea cabinet skeleton.  The steps to do so are fairly straight forward, but just in case you don't have them, there's a [Youtube guide](https://www.youtube.com/watch?v=J9QRqpZBXCo) on how to build a similar Ikea case.
</p>

<p>
Once the chasis was constructed, I took the 64" x 1" pole of spare wood and cut it into 8 inch segments.  These would later be screwed into the inside of the chasis, vertically spaced 4.5" apart from each other so that they could provide support for the shelves.
</p>

<iframe src="//instagram.com/p/rYsApwzFs3/embed/" width="612" height="710" frameborder="0" scrolling="no" allowtransparency="true"></iframe>

<p>
At this point, I tested that each shelf was level by placing my masonite boards on the shelving and made sure everything looked decent.
</p>

<p>
Next, I took a hacksaw and cut my aluminum guard rails into three sections of 24" lengths and screwed them to the bottom, left, and right sides of the chasis.  These pieces of angled aluminum would hold the plexiglass in place after sliding it in from the top.  I decided to countersink all my holes through the aluminum so that the screws wouldn't gouge anyone's hands when transferring it, and that it would look aestheically pleasant.
</p>

<p>
After the body was constructed, I cut two rolls of my LED strips into sections of 12 3-LED segments.  This was roughly 23" in length, which fit perfectly across the width of the cabinet.  
</p>

<p>
Once the LED strips were in place, I drilled holes in the top right side of each section of the cabinet, which would service as escape holes for the power and ground lines of each daisy-chained LED channel.
</p>

<p>
It was at this point that I constructed my Logic and Power circuits and hooked them up to the rest of the unit.  If you want to learn more about the design of these circuits, you can reference the [upverter schematics here](https://upverter.com/kellydunn/0ff3d0f762a5f479/light-organ/).
</p>

<iframe src="//instagram.com/p/qs6ucJzFkm/embed/" width="612" height="710" frameborder="0" scrolling="no" allowtransparency="true"></iframe>

---

## Notes

<p>
It should be mentioned that the complete circuit was not able to be constructed on a single, standard-sized protoboard.  I had to bridge both of the protoboards with jumper cables, which was cumbersome, and eventually resulted in an expensive mistake; some of the data wires became dislodged while testing, which shorted out the initial Teensy Audio Shield.
</p>

Luckily, [PJRC](http://pjrc.com/) has a overnight shipping option which I gladly made quick use of :)

<p>
In the future, it might be much easier to either fabricate the circuit on a larger protoboard or attempt to make a PCB.
</p>

<p>
Given the nature of the situation, I had to make due with what I had, and re-created the logic circuit on a breadboard, which I taped to the bottom of my enclosure box.
</p>

<iframe src="//instagram.com/p/q7VbTKzFg4/embed/" width="612" height="710" frameborder="0" scrolling="no" allowtransparency="true"></iframe>

---

## Results

<iframe src="//instagram.com/p/q04hRTTFjD/embed/" width="612" height="710" frameborder="0" scrolling="no" allowtransparency="true"></iframe>

<blockquote class="twitter-tweet" lang="en" align="center"><p>.<a href="https://twitter.com/kellyleland">@kellyleland</a> was so great tonight!! Encore is definitely needed at <a href="https://twitter.com/simplymeasured">@simplymeasured</a> next week. <a href="http://t.co/fDN3QUE0qU">pic.twitter.com/fDN3QUE0qU</a></p>&mdash; Paige Pauli (@paigepauli) <a href="https://twitter.com/paigepauli/statuses/492943299783573504">July 26, 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

---

## Conclusions

<p>
I was really satisfied with the outcome of this project, and I would love to improve it in the future.  Perhaps even making a PCB is in the cards given the amount of feedback I received.
</p>

---

## Links

- [Light Organ Firmware](https://bitbucket.org/kellydunn/light-organ-firmware)
- [Light Organ Power and Logic Circuit](https://upverter.com/kellydunn/0ff3d0f762a5f479/light-organ/)

----

## Related work

- The awesome [PRJC Audio Library](https://github.com/PaulStoffregen/Audio), which contains a lot of helpful examples, especially for FFT analysis 

---

