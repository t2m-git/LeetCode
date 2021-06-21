# Write your MySQL query statement below
SELECT
    IFNULL(
        ROUND(
                (
                    COUNT(DISTINCT r.requester_id, r.accepter_id)
                    /
                    COUNT(DISTINCT f.sender_id, f.send_to_id)
                )
            , 2)
        , 0) AS accept_rate

FROM
    FriendRequest f,
    RequestAccepted r
