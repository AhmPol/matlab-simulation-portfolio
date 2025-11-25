# Bounce Ball Simulation

![Bounce Ball Animation](bounceball_animation.gif)

## Purpose
This MATLAB project simulates the motion of two bouncing balls with different restitution coefficients and a start delay for the second ball. It demonstrates basic mechanics, energy loss modeling, and dynamic visualization in MATLAB.

## Description
- Models vertical motion of two balls under gravity.  
- Includes **energy loss** on each bounce using restitution coefficients (`r`).  
- Supports a **start delay** for the second ball to demonstrate asynchronous motion.  
- Visualizes the motion in real-time with a simple 2D plot.  

## Files
- `bounceball.m` → Main MATLAB simulation script  
- `Figures/` → Optional folder for saved screenshots or plots of the simulation  

## Key Concepts
- Newtonian mechanics and free-fall motion  
- Energy loss modeling using coefficient of restitution  
- MATLAB visualization and real-time animation  
- Handling multiple objects with different parameters  

## How to Run
1. Open `bounceball.m` in MATLAB.  
2. Run the script to see a real-time simulation of the two bouncing balls.  
3. Observe differences in bounce height and timing due to the restitution coefficients and delay.  

## Notes
- Parameters such as initial height, gravity, restitution coefficients, and time step can be adjusted for experimentation.  
- The simulation loop updates positions and velocities and animates the balls using `plot` and `drawnow`.

