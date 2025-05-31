import { useState, type MouseEventHandler } from 'react';
import './App.css'
import { API_URL } from './constants';

function App() {
  const [response, setResponse] = useState("");
  const [echo, setEcho] = useState("Server is working fine!");

  const sendTestRequestToServer: MouseEventHandler<HTMLButtonElement> = async () => {
    try{
      const api_response: Response = await fetch(`${API_URL}/test?echo=${encodeURIComponent(echo)}`);
      if (!api_response.ok) {
        console.log(`Server responded with code: ${api_response.status}`)
        return;
      }

      const api_json_response: Object = await api_response.json()
      setResponse(JSON.stringify(api_json_response))
    } catch (exception) {
      setResponse(`ERROR: ${exception}`)
    }
  };

  return (
    <>
      <h1>CashTracker v0.1.0 </h1>
      <p>
        Click the button to send diagnostic request with provided echo to the server!
      </p>
      <div className='input-panel'>
        <label htmlFor='echo-input'>Echo</label>
        <input 
          type='text' 
          id='echo-input'
          value={echo}
          onChange={event => setEcho(event.target.value)}
        />
        <button onClick={sendTestRequestToServer}>SEND TEST REQUEST</button>
      </div>
      <h3>Server's response:</h3>
      {response}
    </>
  );
}

export default App;
