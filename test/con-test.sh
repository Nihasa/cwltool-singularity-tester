docker run --privileged -v /home/ngeoffri/SyncWork/Workflows/singularity-tester/test:/mount \
           cwltool-singularity:latest \
           --singularity --debug /mount/con-test.cwl /mount/test-inputs.yml