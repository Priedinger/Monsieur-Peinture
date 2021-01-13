import { CountUp } from 'countup.js';


const num = 50000

const options = {
  separator: '',
  suffix: ' m²'
};


const countUp = new CountUp('compteur', num, options);
if(compteur)
if (!countUp.error) {
  countUp.start();
} else {
  console.error(countUp.error);
}

export { countUp };
