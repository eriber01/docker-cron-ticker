let time = 0;

const Task = () => {
  time++;
  console.log('Cada 5 Segundos: ', time);
  return time
}

module.exports = {
  Task
}