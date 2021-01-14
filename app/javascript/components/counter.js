import { CountUp } from 'countup.js';


const num = 50000;

const options = {
  separator: '',
  suffix: ' m²',
  duration: 10,
};

const initCountUp = () => {
  const counter = document.getElementById('counter');
  if (counter) {
    const countUp = new CountUp('counter', num, options);
    if (!countUp.error) {
      countUp.start();
    } else {
      console.error(countUp.error);
    };
  };
};

export { initCountUp };
