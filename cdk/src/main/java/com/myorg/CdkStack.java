package com.myorg;

import software.amazon.awscdk.Duration;
import software.amazon.awscdk.Stack;
import software.amazon.awscdk.StackProps;
import software.amazon.awscdk.services.sns.Topic;
import software.amazon.awscdk.services.sns.subscriptions.SqsSubscription;
import software.amazon.awscdk.services.sqs.Queue;
import software.constructs.Construct;

public class CdkStack extends Stack {
    public CdkStack(final Construct scope, final String id, final StackProps props) {
        super(scope, id, props);

        Topic topic = Topic.Builder
                .create(this, "cdk_sns_topic_123")
                .topicName("cdk_sns_topic_123")
                .build();

        Queue queue = Queue.Builder
                .create(this, "cdk_sqs_queue_123")
                .queueName("cdk_sqs_queue_123")
                .deliveryDelay(Duration.seconds(3))
                .build();

        topic.addSubscription(new SqsSubscription(queue));

    }
}
