import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="races"
export default class extends Controller {
  connect() { }

  startTime;
  elapsedPauseTime;
  stopwatchInterval = null;

  // Connects to data-action="click->races#start"
  start(event) {
    event.preventDefault()
    if (!this.stopwatchInterval) {
      self.startTime = new Date().getTime();
      self.stopwatchInterval = setInterval(updateStopwatch, 1);
    }

    const zeroPad = (num, places) => String(num).padStart(places, '0');

    function updateStopwatch() {
      var currentTime = new Date().getTime();
      const elapsedTime = currentTime - self.startTime;
      const seconds = Math.floor((elapsedTime / 1000) % 60);
      const minutes = Math.floor((elapsedTime / 60000) % 60);
      const hours = Math.floor((elapsedTime / 3600000) % 24);
      const milliseconds = Math.floor((elapsedTime % 1000) / 1);
      document.getElementById('stopwatch').innerText = `${zeroPad(hours, 2)}:${zeroPad(minutes, 2)}:${zeroPad(seconds, 2)}.${zeroPad(milliseconds, 3)}`;
    }
  }

  end(event) {
    event.preventDefault()
    clearInterval(self.stopwatchInterval);
    self.stopwatchInterval = null;
  }

  setflag(event) {
    event.preventDefault()

    const zeroPad = (num, places) => String(num).padStart(places, '0');

    var currentTime = new Date().getTime();
    const elapsedTime = currentTime - self.startTime;
    const seconds = Math.floor((elapsedTime / 1000) % 60);
    const minutes = Math.floor((elapsedTime / 60000) % 60);
    const hours = Math.floor((elapsedTime / 3600000) % 24);
    const milliseconds = Math.floor((elapsedTime % 1000) / 1);
    document.getElementById('flagwatch').innerText = `${zeroPad(hours, 2)}:${zeroPad(minutes, 2)}:${zeroPad(seconds, 2)}.${zeroPad(milliseconds, 3)}`;
  }
}
