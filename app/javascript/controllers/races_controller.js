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

    function formattedTime(elapsedTime) {
      const zeroPad = (num, places) => String(num).padStart(places, '0');

      const seconds = Math.floor((elapsedTime / 1000) % 60);
      const minutes = Math.floor((elapsedTime / 60000) % 60);
      const hours = Math.floor((elapsedTime / 3600000) % 24);
      const milliseconds = Math.floor((elapsedTime % 1000) / 1);
      const formattedTime = `${zeroPad(hours, 2)}:${zeroPad(minutes, 2)}:${zeroPad(seconds, 2)}.${zeroPad(milliseconds, 3)}`;
      return formattedTime;
    }

    function updateStopwatch() {
      var currentTime = new Date().getTime();
      const elapsedTime = currentTime - self.startTime;
      const seconds = Math.floor((elapsedTime / 1000) % 60);
      const minutes = Math.floor((elapsedTime / 60000) % 60);
      const hours = Math.floor((elapsedTime / 3600000) % 24);
      const milliseconds = Math.floor((elapsedTime % 1000) / 1);
      const formattedTime = `${zeroPad(hours, 2)}:${zeroPad(minutes, 2)}:${zeroPad(seconds, 2)}.${zeroPad(milliseconds, 3)}`;
      document.getElementById('stopwatch').innerText = `${formattedTime}`;
    }
    //disable this button
    document.getElementById('btn-start').disabled = true;
    document.getElementById('btn-stop').disabled = false;
    document.getElementById('btn-check').disabled = false;

    var race_id = document.getElementById('race_id').value;

    this.url = `/races/start?race_id=${race_id}&start_time=${formattedTime(self.startTime)}`
    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html, text/html, application/xhtml+xml",
      }
    })
      .then(response => response.text())
      .then(html => { Turbo.renderStreamMessage(html) })
  }

  end(event) {
    event.preventDefault()
    clearInterval(self.stopwatchInterval);
    self.stopwatchInterval = null;
    document.getElementById('btn-check').disabled = true;
    document.getElementById('btn-stop').disabled = true;
  }

  setcheck(event) {
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
