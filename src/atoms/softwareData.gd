class_name SoftwareData
extends Resource

## How does it move
var movementStrategy: MovementStrategy

## How does it interact with hardware?
var executionStrategy: ExecutionStrategy

## What does it cost to run it
var cpuCycles: int

## What is the name of the software
var softwareName: String

func withMovementStrategy(strategy: MovementStrategy) -> SoftwareData:
    self.movementStrategy = strategy
    return self

func withExecutionStrategy(strategy: ExecutionStrategy) -> SoftwareData:
    self.executionStrategy = strategy
    return self

func withCpuCycles(cycles: int) -> SoftwareData:
    self.cpuCycles = cycles
    return self

func withName(swName: String) -> SoftwareData:
    self.softwareName = swName
    return self
