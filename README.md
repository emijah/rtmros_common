rtmros_common  [![Build Status](https://travis-ci.org/start-jsk/rtmros_common.png)](https://travis-ci.org/start-jsk/rtmros_common)
-------------

A package suite that provides all the capabilities for the ROS users to connect to the robots that run on RT Middleware or RTM-based controllers.


--------------

This document explains how to use and how to contribute to rtm-ros-robotics softwares ([openrtm_aist_core](https://github.com/start-jsk/openrtm_aist_core), [openhrp3](https://github.com/start-jsk/openhrp3), [hrpsys](https://github.com/start-jsk/hrpsys), [rtshell_core](https://github.com/start-jsk/rtshell_core), [rtmros_common](https://github.com/start-jsk/rtmros_common), [rtmros_hironx](https://github.com/start-jsk/rtmros_hironx), [rtmros_tutorial](https://github.com/start-jsk/rtmros_turorial), [rtmros_gazebo](https://github.com/start-jsk/rtmros_gazebo)). These instructions use `rtmros_common` repository as an example, but also works for other rtm-ros-robotics repositories.

1. Install software
 rtm-ros-robotics software is distributed as ros-debian packages, if you already use the ROS system, install this software as follows:
 - `sudo apt-get install ros-$ROS_DISTRO-rtmros-common`
 
 If you have not yet installed the base ROS system, please follow [these instructions](http://wiki.ros.org/hydro/Installation/Ubuntu). These typically tend to be:
 1. ``sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -a` main" > /etc/apt/sources.list.d/ros-latest.list'``  
 2. `wget http://packages.ros.org/ros.key -O - | sudo apt-key add -`  
 3. `sudo apt-get update`  
 4. `sudo apt-get update ros-hydro-ros-base` # you may use ros-groovy-ros-base if you want  
 5. `sudo rosdep init`  
 6. `rosdep update`  
 7. `source /opt/ros/hydro/setup.bash` # it is better to source ROS environment everytime terminal starts (`echo "source /opt/ros/hydro/setup.bash" >> ~/.bashrc`)  

2. Compile from source code
 You have two choices, one is to compile the whole rtm-ros-robotics source code, the other is to just compile the target repository.
 
 Whichever you decide, you must first create the catkin workspace
  1. `mkdir -p ~/catkin_ws/src`
  2. `cd ~/catkin_ws/src`
  3. `wstool init .`
  4. Decide what you want to compile.  
     To compile everything
     - `rosws merge https://raw.github.com/start-jsk/rtmros_common/master/.rosinstall -y`  
    Otherwise, to compile only the target repository
     - `wstool set rtm-ros-robotics/rtmros_common https://github.com/start-jsk/rtmros_common --git -y`
  5. `wstool update `
  6. `cd ..`
  7. `source /opt/ros/hydro/setup.bash`
  8. `rosdep install -v -r --from-paths src --ignore-src --rosdistro hydro -y`
  9. `catkin_make`

3. Contributing to rtm-ros-robotics related projects.
 1. First fork the target repository on GitHub
 2. Setup ROS environment
    `$ source ~/catkin_ws/devel/setup.bash`
 2. Move to the package directory
    `$ roscd <name>`
 3. Add your forked repository called `<name>` as `<github>`  
   `git remote add <github> <name>`  
   To add this repository, you would replace `<name>` with `https://github.com/start-jsk/rtmros_common.git`. A typical `<name>` if you fork this repository would be, `https://github.com/<your github user name>/rtmros_common.git`
 4. `git add origin https://github.com/<your github user name>/rtmros_common`
 6. `git pull upstream master`
 7. Write awesome code
 8. Commit it  
    `git commit -m "detailed description of what you did"`
 9. Push to your Github repository
    `git push <github>`
 10. Submit a pull request on GitHub to the upstream repository
 11. Please check travic-ci status after sending your pull request.

4. Use other forked repository *before* merging into master.

 You don't need to wait for the maintainers to merge some pull requests by others before you use them.
 1. Add other remote repository to your git remote  
   `git remote add <awesome-fork> https://github.com/<user>/rtmros_common`
 2. Fetch branches from the remote  
   `git fetch <awesome-fork>`
 3. Merge those remote branch into your current branch  
   `git merge <awesome-fork>/<branch-name>`

