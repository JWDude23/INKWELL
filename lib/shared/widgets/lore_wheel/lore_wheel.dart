import 'dart:async';

import 'package:flutter/material.dart';

import 'lore_stage.dart';
import 'lore_painter.dart';
import 'lore_theme.dart';
import 'lore_stage_effects.dart';
import 'lore_animation.dart';
import 'lore_cracks.dart';
import 'lore_crack_effect.dart';
import 'lore_break_effect.dart';

import '../../services/feedback_service.dart';
import '../../services/lore_event_service.dart';



class LoreWheel extends StatefulWidget {

  const LoreWheel({

    super.key,

    required this.lore,

    required this.maxLore,

    required this.color,

    required this.onChanged,

    this.theme =
        LoreTheme.classic,

  });



  final int lore;

  final int maxLore;

  final Color color;

  final Function(int) onChanged;

  final LoreTheme theme;



  @override
  State<LoreWheel> createState() =>
      _LoreWheelState();

}







class _LoreWheelState
    extends State<LoreWheel>
    with SingleTickerProviderStateMixin {



  late AnimationController _controller;

  late Animation<double> _pulse;





  void setupAnimation() {


    final stage =
        getLoreStage(
          widget.lore,
          widget.maxLore,
        );



    _controller.duration =
        LoreAnimation.pulseSpeed(stage);



    _pulse =
        Tween<double>(

          begin:
              1.0,

          end:
              LoreAnimation.pulseAmount(stage),

        ).animate(

          CurvedAnimation(

            parent:
                _controller,

            curve:
                Curves.easeInOut,

          ),

        );



    _controller.repeat(
      reverse: true,
    );


  }







  @override
  void initState() {

    super.initState();


    _controller =
        AnimationController(

          vsync:
              this,

          duration:
              const Duration(
                milliseconds: 3000,
              ),

        );



    setupAnimation();

  }







  @override
  void didUpdateWidget(
      covariant LoreWheel oldWidget
  ) {

    super.didUpdateWidget(oldWidget);



    if(oldWidget.lore != widget.lore) {


      setupAnimation();



      if(widget.lore >= widget.maxLore) {

        LoreEventService.loreCompleted();

      }


    }


  }







  @override
  Widget build(BuildContext context) {



    final stage =
        getLoreStage(
          widget.lore,
          widget.maxLore,
        );





    return _LoreHoldDetector(


      onTap: () {

        FeedbackService.loreIncrease(
  lore: widget.lore,
  maxLore: widget.maxLore,
);

widget.onChanged(1);

      },



      onHold: () {

        FeedbackService.loreDecrease(
  lore: widget.lore,
  maxLore: widget.maxLore,
);

widget.onChanged(-1);

      },



      child:

          AnimatedBuilder(

            animation:
                _controller,


            builder:
                (context, child) {


                  final shake =
                      LoreBreakEffect
                          .shakeAmount(
                            widget.lore,
                            widget.maxLore,
                          );



                  return Transform.translate(

                    offset:

                        Offset(

                          shake *
                              (_controller.value - .5),

                          0,

                        ),


                    child:
                        child,

                  );


                },



            child:

                ScaleTransition(

                  scale:
                      _pulse,



                  child:

                      AnimatedContainer(

                        duration:

                            const Duration(
                              milliseconds: 400,
                            ),



                        width:
                            140,


                        height:
                            140,



                        decoration:

                            BoxDecoration(

                              shape:
                                  BoxShape.circle,



                              border:

                                  Border.all(

                                    color:
                                        widget.color,


                                    width:

                                        LoreStageEffects
                                            .borderWidth(stage),

                                  ),



                              boxShadow: [

                                BoxShadow(

                                  color:

                                      widget.color.withValues(

                                        alpha:

                                            LoreStageEffects
                                                .glowAmount(stage),

                                      ),


                                  blurRadius:
                                      20,

                                ),

                              ],

                            ),






                        child:

                            Stack(

                              alignment:
                                  Alignment.center,



                              children: [



                                AnimatedContainer(

                                  duration:

                                      const Duration(
                                        milliseconds: 300,
                                      ),


                                  decoration:

                                      BoxDecoration(

                                        shape:
                                            BoxShape.circle,


                                        color:

                                            widget.color.withValues(

                                              alpha:

                                                  LoreBreakEffect
                                                      .flashAmount(
                                                        widget.lore,
                                                        widget.maxLore,
                                                      ),

                                            ),

                                      ),

                                ),





                                CustomPaint(

                                  size:

                                      const Size(
                                        140,
                                        140,
                                      ),



                                  painter:

                                      LorePainter(

                                        progress:

                                            (widget.lore /
                                                    widget.maxLore)
                                                .clamp(
                                                  0.0,
                                                  1.0,
                                                ),


                                        theme:
                                            widget.theme,

                                      ),

                                ),





                                CustomPaint(

                                  size:

                                      const Size(
                                        140,
                                        140,
                                      ),



                                  painter:

                                      LoreCracks(

                                        color:
                                            widget.color,


                                        intensity:

                                            LoreCrackEffect
                                                .intensity(stage),

                                      ),

                                ),






                                Center(

                                  child:

                                      AnimatedSwitcher(

                                        duration:

                                            const Duration(
                                              milliseconds: 250,
                                            ),



                                        child:

                                            Text(

                                              "${widget.lore}",


                                              key:

                                                  ValueKey(
                                                    widget.lore,
                                                  ),



                                              style:

                                                  TextStyle(

                                                    fontSize:
                                                        48,


                                                    fontWeight:
                                                        FontWeight.bold,


                                                    color:
                                                        widget.color,

                                                  ),

                                            ),

                                      ),

                                ),



                              ],

                            ),

                      ),

                ),

          ),


    );


  }








  @override
  void dispose() {

    _controller.dispose();

    super.dispose();

  }


}









class _LoreHoldDetector extends StatefulWidget {


  const _LoreHoldDetector({

    required this.child,

    required this.onTap,

    required this.onHold,

  });



  final Widget child;

  final VoidCallback onTap;

  final VoidCallback onHold;





  @override
  State<_LoreHoldDetector> createState() =>
      _LoreHoldDetectorState();

}








class _LoreHoldDetectorState
    extends State<_LoreHoldDetector> {



  Timer? _timer;


  bool _holding = false;






  void startHolding() {


    _holding = true;



    _timer =
        Timer.periodic(

          const Duration(
            milliseconds: 100,
          ),


          (_) {


            if(!_holding || !mounted) {

              return;

            }



            widget.onHold();


          },


        );


  }







  void stopHolding() {


    _holding = false;


    _timer?.cancel();


    _timer = null;


  }








  @override
  void dispose() {

    stopHolding();


    super.dispose();

  }








  @override
  Widget build(BuildContext context) {


    return GestureDetector(


      onTap:
          widget.onTap,



      onLongPressStart:
          (_) {

            startHolding();

          },



      onLongPressEnd:
          (_) {

            stopHolding();

          },



      child:
          widget.child,


    );


  }


}