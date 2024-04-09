class_name ResourceInfo
extends HFlowContainer

var _gpuValue: RichTextLabel:
	get:
		return $GPU/Value

var _cpuValue: RichTextLabel:
	get:
		return $CPU/Value

var _ramValue: RichTextLabel:
	get:
		return $RAM/Value

var _storageValue: RichTextLabel:
	get:
		return $TB/Value

var _bitCoinValue: RichTextLabel:
	get:
		return $BTC/Value

var _resources: Resources

func init(resources: Resources):
	_resources = resources
	_resources.changed.connect(_updateResources)
	_updateResources()

func _updateResources():
	# Update the UI to reflect the new resources
	_cpuValue.text = str(_resources.cpuCycles)
	_gpuValue.text = str(_resources.gpuCycles)
	_ramValue.text = str(_resources.ram)
	_storageValue.text = str(_resources.storage)
	_bitCoinValue.text = str(_resources.bitcoin)
