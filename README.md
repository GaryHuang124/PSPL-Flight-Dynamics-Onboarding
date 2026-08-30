<h1> Gary Huang Flight Dynamics Onboarding </h1>

<h2> 3-DoF Model </h2>
The code creates variables based on the parameters given. The launch angle theta is arbitrarily set to pi / 4. Arrays are created to record the rocket's state and time. A time step size of 0.1 seconds is used. The first while loop is for when the rocket is still burning fuel and still has thrust. The second while loop is almost identical to the first one, just without thrust. Figures are then plotted for position and velocity. 

To run the rocket animation, type RocketAnimation(position, theta\_array) in the Command Window.

<h2> Dzhanibekov Effect </h2>
The code dzhanibekov_onboarding.m simulates the Dzhanibekov effect for a tennis racket. The code begins by setting the inertia for each principal axis and creating a vector of all 3 inertias. The code then sets the initial angular velocity and initial orientation. Orientation is written as a quaternion. The code combines those two vectors into one vector with angular velocity first and initial orientation second.

The code state_vector_derivative.m calculates the time derivative of the state vector. The math can be found in the Flight Dynamics Onboarding pdf. I have included the math here for completeness.

For the angular acceleration: 

$\dot{\omega}_x = \frac{(I_y - I_z) \omega_y \omega_z}{I_x}$ 

$\dot{\omega}_y = \frac{(I_z - I_x) \omega_z \omega_x}{I_y}$ 

$\dot{\omega}_z = \frac{(I_x - I_y) \omega_y \omega_x}{I_x}$ 

For the quaternion:
$\begin{bmatrix} 0&-\omega_x&-\omega_y&-\omega \\ \omega_x&0&\omega_z&-\omega_y\\ \omega_y&-\omega_z&0&\omega_x\\ \omega_z&\omega_y&-\omega_x&0 \end{bmatrix}$

I combine the time derivates of the angular velocity and orientation into one column vector.

Going back to dzhanibekov_onboarding.m, I use ode45 to integrate the system from 0 to 20 seconds.

This concludes my Flight Dynamics Onboarding project.

