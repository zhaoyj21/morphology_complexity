#!/bin/bash
#SBATCH -J comsp-js
#SBATCH -p cnmix
#SBATCH -N 1
#SBATCH -o %j.out
#SBATCH -e %j.err
#SBATCH --no-requeue
#SBATCH --ntasks-per-node=4
module load compiles/intel/2019/u4/config
for ff1 in K*
do 
   cd ./$ff1
   for ff2 in R*
   do 
      cd ./$ff2
      mpiexec.hydra -n 4 lmp_sj<in.sphere>out
	  #echo $ff2
	  cd ../
   done
   cd ../
done
