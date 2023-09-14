import logging
import time


def medisearch_ai():
    from medisearch_client import MediSearchClient
    import uuid

    from app.settings import medisearch_api_key
    logger = logging.getLogger(__name__)
    api_key = medisearch_api_key
    conversation_id = str(uuid.uuid4())
    client = MediSearchClient(api_key=api_key)
    tic = time.time()
    responses = client.send_user_message(conversation_id=conversation_id, conversation=[  "Is cancer transmissible?",
  "Cancer is generally not transmissible between individuals. However, there are rare exceptions.",
  "What are these rare expections?"],
                                         should_stream_response=True, language="English")
    logger.info("time taken for api response".format(int(time.time() - tic)))
    for response in responses:
        if response["event"] == "llm_response":
            llm_answer = response["text"]
            print(llm_answer)

medisearch_ai()
