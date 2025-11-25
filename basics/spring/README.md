# Spring-Mass-Damper Simulation

## Purpose
This MATLAB project simulates the dynamics of a spring-mass-damper system, visualizing both displacement and velocity over time, as well as animating the oscillatory motion of the mass. It demonstrates fundamental mechanical system modeling and numerical solution of differential equations.

## Description
- Models a **single-degree-of-freedom spring-mass-damper system** with parameters:
  - Mass (`m = 1 kg`)  
  - Spring constant (`k = 20 N/m`)  
  - Damping coefficient (`c = 1 Ns/m`)  
- Uses MATLAB’s `ode45` solver to compute time evolution of **displacement and velocity**.  
- Plots displacement and velocity in a **subplot figure**.  
- Animates the mass motion in a separate figure to visualize oscillations.

## Files
- `spring.m` → MATLAB script  
- `Figures/` → Optional folder for screenshots or saved plots  

## Key Concepts
- Differential equations for mechanical systems  
- Harmonic motion and damping  
- Numerical solution using `ode45` in MATLAB  
- Data visualization and animation  

## How to Run
1. Open `spring.m` in MATLAB.  
2. Run the script to see both the displacement/velocity plots and the animation of the mass.  
3. Experiment by adjusting `m`, `k`, `c`, or initial conditions to observe system behavior.

## Notes
- The animation provides an intuitive visualization of the spring-mass dynamics.  
- Parameters can be modified for further study of underdamped, critically damped, or overdamped systems.
