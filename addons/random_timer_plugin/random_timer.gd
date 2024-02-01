@tool
class_name RandomTimer
extends Timer
## An extension of [Timer] that uses [b]variance[/b] for random countdown times.

const MIN_WAIT_TIME: float = 0.05

## [b]Variance[/b], in [b]seconds[/b], applied to the base [Timer].[br][br]
## [b]Variance[/b] creates the [code]min[/code] and [code]max[/code] values for the random [b]Wait Time[/b] range.[br][br]
## [code]min[/code] is calculated as [code]wait_time - variance[/code].[br]
## [code]min[/code] is calculated as [code]wait_time + variance[/code].[br][br]
## For example a [b]Wait Time[/b] of [b]3[/b] and a [b]Variance[/b] of [b]1[/b] would produce countdown times between [b]2[/b] and [b]4[/b].[br][br]
## [b]Note:[/b] The [b]Wait Time[/b] value calculated with [b]Variance[/b] will never be set lower than [code]0.05[/code].
@export_range (0, 4096) var variance: float = 1
@export_group("Wait Time Recalculation")
## If [code]true[/code], a new [b]Wait Time[/b] will be calculated every time the [Timer] times out.
@export var randomize_on_timeout: bool = true
## If [code]true[/code], a new [b]Wait Time[/b] will be calculated every time the [method RandomTimer.start] is exectuted.
@export var randomize_on_start: bool = true

var _base_wait_time: float = 0


func _enter_tree() -> void:
	timeout.connect(_on_timeout)


func _ready() -> void:
	_base_wait_time = wait_time
	_randomise_wait_time()


func _exit_tree() -> void:
	timeout.disconnect(_on_timeout)


func start(time_sec: float = -1) -> void:
	if !randomize_on_start:
		super(time_sec)
		return

	if time_sec > 0:
		_base_wait_time = wait_time

	_randomise_wait_time()
	super()


func _on_timeout() -> void:
	if randomize_on_timeout:
		_randomise_wait_time()


func _randomise_wait_time() -> void:
	var random_wait_time: float = randf_range(
		_base_wait_time - variance,
		_base_wait_time + variance
	)
	wait_time = max(MIN_WAIT_TIME, random_wait_time)
