Time Scaling with Overlap and Add
===============

* ========================================================================
*   Author:  Harrison Zafrin (hzz200@nyu.edu)(harrison@bombsandbottles.com)
*   Organization:  Bombs and Bottles LLC. - www.bombsandbottles.com
*
*   Title: Time Scaling with Overlap and Add
*
*   Description:  A MATLAB implementation of time domain strechting/compression with overlap and add (OLA). 
*                  Optional pitch shifting via resampling.
* ========================================================================


Usage:  
====== 
	Zafrin_Harrison_DSTII_4_1.m is a script which executes both the pitch shifting and time stretching possibilites.
	You can change the parameters at the top of the script to change the timbre of processing.
	ex. a shorter window size for a smoother time stretch.
	Use the pitch_on variable and set to either 1 or 0 to enable resampling to adjust the pitch of the audio.

	Zafrin_Harrison_DSTII_4_1_time_scaling_OLA.m is the function which implements OLA and does all the real DSP.
