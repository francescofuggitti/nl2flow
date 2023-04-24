
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Domain file automatically generated by the Tarski FSTRIPS writer
;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain verdi-catalog)
    (:requirements :typing :action-costs)
    (:types
        generic - object
        agent - object
        mode - object
        type__of__job_id - generic
        type__of__occupation_id - generic
        type__of__original_error - generic
        type__of__list_of_signature_item_spec - generic
        type__of__slot_fill_form_title - generic
        type__of__data_objects - generic
        type__of__sf_context - generic
    )

    (:constants
        a b data-mapper error_handler fallback slot-filler slot_filler_for_planner slot_filler_form_agent - agent
        data_objects - type__of__data_objects
        job_id - type__of__job_id
        list_of_signature_item_spec - type__of__list_of_signature_item_spec
        occupation_id - type__of__occupation_id
        original_error - type__of__original_error
        sf_context - type__of__sf_context
        slot_fill_form_title - type__of__slot_fill_form_title
    )

    (:predicates
        (has_done ?x1 - agent)
        (failed ?x1 - agent)
        (known ?x1 - generic)
        (is_slotfillable ?x1 - generic)
        (is_mappable ?x1 - generic ?x2 - generic)
    )

    (:functions
        (total-cost) - number
        (affinity ?x1 - generic ?x2 - generic) - number
    )

    (:action a
        :parameters ()
        :precondition (and (not (has_done a)) (not (failed a)))
        :effect (and
            (has_done a)
            (known job_id)
            (increase (total-cost) 1))
    )

    (:action b
        :parameters ()
        :precondition (and (not (has_done b)) (not (failed b)) (known occupation_id))
        :effect (and
            (has_done b)
            (increase (total-cost) 1))
    )

    (:action error_handler
        :parameters ()
        :precondition (and (not (has_done error_handler)) (not (failed error_handler)) (known original_error))
        :effect (and
            (has_done error_handler)
            (increase (total-cost) 1))
    )

    (:action slot_filler_for_planner
        :parameters ()
        :precondition (and (not (has_done slot_filler_for_planner)) (not (failed slot_filler_for_planner)) (known list_of_signature_item_spec))
        :effect (and
            (has_done slot_filler_for_planner)
            (known data_objects)
            (increase (total-cost) 1))
    )

    (:action slot_filler_form_agent
        :parameters ()
        :precondition (and (not (has_done slot_filler_form_agent)) (not (failed slot_filler_form_agent)) (known sf_context))
        :effect (and
            (has_done slot_filler_form_agent)
            (increase (total-cost) 1))
    )

    (:action fallback
        :parameters ()
        :precondition (and (not (has_done fallback)) (not (failed fallback)))
        :effect (and
            (has_done fallback)
            (increase (total-cost) 1))
    )

    (:action data-mapper_type__of__job_id
        :parameters (?x - type__of__job_id ?y - type__of__job_id)
        :precondition (and (known ?x) (not (known ?y)))
        :effect (and
            (known ?y)
            (increase (total-cost) 3))
    )

    (:action data-mapper_type__of__slot_fill_form_title
        :parameters (?x - type__of__slot_fill_form_title ?y - type__of__slot_fill_form_title)
        :precondition (and (known ?x) (not (known ?y)))
        :effect (and
            (known ?y)
            (increase (total-cost) 3))
    )

    (:action data-mapper_type__of__occupation_id
        :parameters (?x - type__of__occupation_id ?y - type__of__occupation_id)
        :precondition (and (known ?x) (not (known ?y)))
        :effect (and
            (known ?y)
            (increase (total-cost) 3))
    )

    (:action data-mapper_type__of__list_of_signature_item_spec
        :parameters (?x - type__of__list_of_signature_item_spec ?y - type__of__list_of_signature_item_spec)
        :precondition (and (known ?x) (not (known ?y)))
        :effect (and
            (known ?y)
            (increase (total-cost) 3))
    )

    (:action data-mapper_type__of__original_error
        :parameters (?x - type__of__original_error ?y - type__of__original_error)
        :precondition (and (known ?x) (not (known ?y)))
        :effect (and
            (known ?y)
            (increase (total-cost) 3))
    )

    (:action data-mapper_type__of__sf_context
        :parameters (?x - type__of__sf_context ?y - type__of__sf_context)
        :precondition (and (known ?x) (not (known ?y)))
        :effect (and
            (known ?y)
            (increase (total-cost) 3))
    )

    (:action data-mapper_type__of__data_objects
        :parameters (?x - type__of__data_objects ?y - type__of__data_objects)
        :precondition (and (known ?x) (not (known ?y)))
        :effect (and
            (known ?y)
            (increase (total-cost) 3))
    )

    (:action data-mapper
        :parameters (?x - generic ?y - generic)
        :precondition (and (known ?x) (not (known ?y)) (is_mappable ?x ?y))
        :effect (and
            (known ?y)
            (increase (total-cost) (affinity ?x ?y)))
    )

    (:action slot-filler---data_objects
        :parameters ()
        :precondition (and (not (known data_objects)) (has_done slot_filler_for_planner))
        :effect (and
            (known data_objects)
            (increase (total-cost) 50))
    )

    (:action slot-filler---list_of_signature_item_spec
        :parameters ()
        :precondition (not (known list_of_signature_item_spec))
        :effect (and
            (known list_of_signature_item_spec)
            (increase (total-cost) 50))
    )

    (:action slot-filler---sf_context
        :parameters ()
        :precondition (not (known sf_context))
        :effect (and
            (known sf_context)
            (increase (total-cost) 50))
    )

    (:action slot-filler---job_id
        :parameters ()
        :precondition (and (not (known job_id)) (has_done a))
        :effect (and
            (known job_id)
            (increase (total-cost) 50))
    )

    (:action slot-filler---slot_fill_form_title
        :parameters ()
        :precondition (not (known slot_fill_form_title))
        :effect (and
            (known slot_fill_form_title)
            (increase (total-cost) 50))
    )

    (:action slot-filler---occupation_id
        :parameters ()
        :precondition (not (known occupation_id))
        :effect (and
            (known occupation_id)
            (increase (total-cost) 50))
    )

    (:action slot-filler---original_error
        :parameters ()
        :precondition (not (known original_error))
        :effect (and
            (known original_error)
            (increase (total-cost) 50))
    )

    (:action slot-filler-alt
        :parameters (?x - generic)
        :precondition (and (not (known ?x)) (is_slotfillable ?x))
        :effect (and
            (known ?x)
            (increase (total-cost) 500))
    )

)