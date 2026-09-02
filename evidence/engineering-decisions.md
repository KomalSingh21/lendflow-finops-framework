# Engineering Decisions & Trade-offs

## 1. Do not optimise on CPU alone

Low CPU is a useful screening signal, not proof that a resource can be resized. Memory pressure, EBS throughput, network behaviour, latency and peak load require validation.

## 2. Treat database options as scenarios

RDS right-sizing and Aurora Serverless are different architectural paths. They are therefore modelled as mutually exclusive alternatives rather than additive savings.

## 3. Protect compliance boundaries

Cost reduction cannot justify removing payment isolation, audit retention, required redundancy or data-localisation controls.

## 4. Prefer workload-appropriate pricing

Spot is suited to interruptible batch/analytics workloads with checkpointing and fallback. Core payment capacity remains more conservative.

## 5. Automate repetitive non-production savings

Scheduled scaling is more reliable than asking engineers to remember shutdowns. Production capacity remains governed by service-level controls.

## 6. Make uncertainty visible

Where telemetry or implementation scope is missing, the model uses conditional language or leaves cost estimates unresolved rather than manufacturing evidence.

## 7. Optimise the whole system

Cross-AZ and cross-region transfer opportunities can exceed the savings available from individual resource resizing. Architecture and traffic patterns therefore matter as much as instance selection.
