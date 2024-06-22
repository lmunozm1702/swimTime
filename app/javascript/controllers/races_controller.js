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
      const formattedTime = `${zeroPad(hours, 2)}:${zeroPad(minutes, 2)}:${zeroPad(seconds, 2)}.${zeroPad(milliseconds, 3)}`;
      document.getElementById('stopwatch').innerText = `${formattedTime}`;
    }
    //disable this button
    document.getElementById('btn-start').disabled = true;
    document.getElementById('btn-stop').disabled = false;
    document.getElementById('btn-check').disabled = false;

    var race_id = document.getElementById('race_id').value;

    localStorage.setItem('startCheckpoint', self.startTime);
    localStorage.setItem('armStart', null);
    localStorage.setItem('armEnd', null);
    localStorage.setItem('endCheckpoint', null);

    this.url = `/races/start?race_id=${race_id}&start_time=${self.startTime}`
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
    self.endTime = new Date().getTime();
    clearInterval(self.stopwatchInterval);
    self.stopwatchInterval = null;
    document.getElementById('btn-check').disabled = true;
    document.getElementById('btn-stop').disabled = true;

    var race_id = document.getElementById('race_id').value;

    this.url = `/races/finish?race_id=${race_id}&end_time=${self.endTime}`
    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html, text/html, application/xhtml+xml",
      }
    })
      .then(response => response.text())
      .then(html => { Turbo.renderStreamMessage(html) })
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
    if (localStorage.getItem('startCheckpoint') == 'null') {
      localStorage.setItem('startCheckpoint', currentTime);
    } else {
      localStorage.setItem('endCheckpoint', currentTime);
      console.log(localStorage);
      document.getElementById('flagwatch').innerText = `${zeroPad(hours, 2)}:${zeroPad(minutes, 2)}:${zeroPad(seconds, 2)}.${zeroPad(milliseconds, 3)}`;
      // call controller with all 4 times from local storage
      var race_id = document.getElementById('race_id').value;
      this.url = `/races/checkpoint?race_id=${race_id}&start_checkpoint=${localStorage.getItem('startCheckpoint')}&arm_start=${localStorage.getItem('armStart')}&arm_end=${localStorage.getItem('armEnd')}&end_checkpoint=${localStorage.getItem('endCheckpoint')}`
      fetch(this.url, {
        headers: {
          Accept: "text/vnd.turbo-stream.html, text/html, application/xhtml+xml",
        }
      })
        .then(response => response.text())
        .then(html => { Turbo.renderStreamMessage(html) })

      localStorage.setItem('startCheckpoint', currentTime);
      localStorage.setItem('armStart', null);
      localStorage.setItem('armEnd', null);
      localStorage.setItem('endCheckpoint', null);
    }
    console.log(localStorage);
  }
}
