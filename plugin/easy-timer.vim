command! -nargs=1 Easytimer call Easytimer(<f-args>)

let s:counter = { "value" : 0 }

function! s:counter.count(timer)
  echo self.value 
  if self.value == 0
    echo "Time up!!"
    call timer_stop(a:timer)
  endif
  let self.value -= 1

endfunction


function! Easytimer(num)
  let s:counter.value = a:num
  let s:timer = timer_start(1000, 
  \   s:counter.count, 
  \   {'repeat': -1})

endfunction
