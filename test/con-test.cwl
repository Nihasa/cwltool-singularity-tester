#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: echo
hints:
  DockerRequirement:
    dockerPull: alpine:latest
inputs:
  src:
    type: string
    inputBinding:
      position: 1
    default: "Hello World!"
outputs:
  example_out:
    type: stdout
stdout: output.txt