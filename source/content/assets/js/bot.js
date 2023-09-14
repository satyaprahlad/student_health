const chatbox = document.getElementById('chatbox');
const userInput = document.getElementById('userInput');

function uuid()
{
   var chars = '0123456789abcdef'.split('');

   var uuid = [], rnd = Math.random, r;
   uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
   uuid[14] = '4'; // version 4

   for (var i = 0; i < 36; i++)
   {
      if (!uuid[i])
      {
         r = 0 | rnd()*16;

         uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r & 0xf];
      }
   }

   return uuid.join('');
}
let my_uuid = uuid()
let conversation = [];
        $("#userInput").keypress(function (event) {
            if (event.keyCode === 13) {
                $("#sendButton").click();
            }
        });
function sendMessage() {
    const userMessage = userInput.value;
    lastMessageDiv = null;
    // Display user message in the chatbox
    appendMessage('You', userMessage);
    conversation.push(userMessage)

    function fetch_data() {
        $("#medi_search_status").css("display","inline-block")
        fetch('/operations/medi-search', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                "X-CSRFToken": csrfToken

            },
            body: JSON.stringify({
                conversation_id: my_uuid,
                conversation: conversation
            })
        })
            .then(response => response.json())
            .then(data => {
                $("#medi_search_status").css("display","none")
                if (data['text']) {
                    // if (lastMessageDiv) {
                    //     lastMessageDiv.innerHTML = data['text']
                    // } else {
                        appendMessage('Assistant', data['text']);
                        conversation.push(data['text'])
                    //}
                }

                // if (data["event"] == "llm_response") {
                //     fetch_data();
                // } else {
                    conversation.push(data['text'])
                //}

                //const assistantMessage = data.choices[0].message.content;

                // Display assistant message in the chatbox

            })
            .catch(error => {
                 $("#medi_search_status").css("display","none")
               console.error('Error:', error)
            });
    }

    fetch_data()

    // Send user message to GPT-3.5 API


    userInput.value = '';
}

function appendMessage(sender, content) {
    const messageDiv = document.createElement('div');
    messageDiv.classList.add('message');
    messageDiv.innerHTML = `<strong>${sender}:</strong> ${content}`;
    chatbox.appendChild(messageDiv);
    chatbox.scrollTop = chatbox.scrollHeight;

}

function appendToExistingMessage(sender, content) {
    const messageDiv = document.createElement('div');
    messageDiv.classList.add('message');
    messageDiv.innerHTML = `<strong>${sender}:</strong> ${content}`;
    chatbox.appendChild(messageDiv);
    chatbox.scrollTop = chatbox.scrollHeight;
    lastMessageDiv = messageDiv
}
