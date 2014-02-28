rtmros_common  [![Build Status](https://travis-ci.org/start-jsk/rtmros_common.png)](https://travis-ci.org/start-jsk/rtmros_common)
-------------

A package suite that provides all the capabilities for the ROS users to connect to the robots that run on RT Middleware or RTM-based controllers.


--------------

This document explains how to use and how to contribute to rtm-ros-robotics softwares ([openrtm_aist_core](https://github.com/start-jsk/openrtm_aist_core), [openhrp3](https://github.com/start-jsk/openhrp3), [hrpsys](https://github.com/start-jsk/hrpsys), [rtshell_core](https://github.com/start-jsk/rtshell_core), [rtmros_common](https://github.com/start-jsk/rtmros_common), [rtmros_hironx](https://github.com/start-jsk/rtmros_hironx), [rtmros_tutorial](https://github.com/start-jsk/rtmros_turorial), [rtmros_gazebo](https://github.com/start-jsk/rtmros_gazebo)). These instructions use `rtmros_common` repository as an example, but also works for other rtm-ros-robotics repositories.

1. Install software
 rtm-ros-robotics software is distributed as ros-debian packages, if you already use the ROS system, install this software as follows:
 - `sudo apt-get install ros-$ROS_DISTRO-rtmros-common`
 
 If you have not yet installed the base ROS system, please follow [this instruction](http://wiki.ros.org/hydro/Installation/Ubuntu).
 - ``sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -a` main" > /etc/apt/sources.list.d/ros-latest.list'``
 - `wget http://packages.ros.org/ros.key -O - | sudo apt-key add -`
 - `sudo apt-get update`
 - `sudo apt-get update ros-hydro-ros-base` # you may use ros-groovy-ros-base if you want
 - `sudo rosdep init`
 - `rosdep update`
 - `source /opt/ros/hydro/setup.bash` # it is better to source ROS environment everytime terminal starts (`echo "source /opt/ros/hydro/setup.bash" >> ~/.bashrc`)

2. Compile from source code
 You have two choices, one is to compile the whole rtm-ros-robotics source code, the other is to just compile the target repository.
 
 Whichever you decide, you must first create the catkin workspace
  1. `mkdir -p ~/catkin_ws/src`
  2. `cd ~/catkin_ws/src`
  3. `wstool init .`
 
 To compile everything
 6. `rosws merge https://raw.github.com/start-jsk/rtmros_common/master/.rosinstall -y`
 
 Otherwise, to compile only the target repository
 6'. `wstool set rtm-ros-robotics/rtmros_common https://github.com/start-jsk/rtmros_common --git -y`
 
After this both methods need the following procedures.
 7. `wstool update `
 8. `cd ..`
 9. `source /opt/ros/hydro/setup.bash`
 10. `rosdep install -v -r --from-paths src --ignore-src --rosdistro hydro -y`
 11. `catkin_make`

3. Contributing to rtm-ros-robotics related projects.
 - First fork the target repository on GitHub
 - Move to the package directory
 - `$ source ~/catkin_ws/devel/setup.bash`
 - '$`roscd rtmros_common`
 - Add your forked repository called `<name>` as `<github>`
 - `git remote add <github> <name>`
To add this repository, you would replace `<name>` with https://github.com/start-jsk/rtmros_common.git
 - `git add origin https://github.com/<your github user name>/rtmros_common`
 - `git pull upstream master`
 - write awesome code
 - `git commit -m "detailed description of what you did"`
 - `git push origin master`
 - Submit a pull request on GitHub to the repository
 - Please check travic-ci status after sending your pull request.

4. Uses other forked repository *before* merged into master.

You don't need to wait for the maintainers to merge some pull requests by others
before you use them.
 - Adding other's remote repository to your git remote
 - `git remote add <awesome-fork> https://github.com/<user>/rtmros_common`
 - Fetch branches from the remote.
 - `git fetch <awesome-fork>`
 - Merge those remote branch into your current branch
 - `git merge <awesome-fork>/<branch-name>`

