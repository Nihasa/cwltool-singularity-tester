docker run -v /home/ngeoffri/SyncWork/Workflows/singularity-tester/test:/mount \
           cwltool-singularity:latest \
           --singularity --debug /mount/cwl-test.cwl /mount/test-inputs.yml