import { CountUp } from 'countup.js';


const num = document.getElementById('counter').dataset.value;


const options = {
  separator: '',
  suffix: ' m²',
  duration: 10,
};

const initCountUp = () => {

let start = true

  if (counter) {
    window.addEventListener('scroll', () => {
      if (window.scrollY !== 0) {
        if (start === true){
          const countUp = new CountUp('counter', num, options);
          start = false
          if (!countUp.error) {
            countUp.start();
          } else {
            console.error(countUp.error);
          };
        };
      }
     })
   };
};

export { initCountUp };
