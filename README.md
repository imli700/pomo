# pomo
Probably the simplest pomodoro timer CLI for Linux

### Installation

You don't have to install it. Just copy the following snippet in your `.profile` / `.bashrc` / `.zshrc`.

```bash
function pomo() {
    arg1=$1
    shift
    args="$*"

    min=${arg1:?Example: pomo 15 Take a break}
    sec=$((min * 60))
    msg="${args:?Example: pomo 15 Take a break}"

    while true; do
        sleep "${sec:?}" && echo "${msg:?}" && notify-send -u critical -t 0 "${msg:?}" -a pomo
    done
}
```

### Usage

```
pomo 15 Take a break
```
