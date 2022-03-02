/*
CREATE OR REPLACE FUNCTION VALIDATE_STUDENTSECTION_INSERT() RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
declare
	studentid integer;
	section_quota integer;
	quota integer;
begin
	select ss.studentid
	into studentid
	from studentsection ss
	where ss.studentid = new.studentid and ss.sectionid = new.sectionid;

	if studentid is not null then
		raise exception 'student already in this section';
	end if;

	select s.quota
	into section_quota
	from section s
	where s.sectionid = new.sectionid;

	select count(ss.studentid)
	into quota
	from studentsection ss
	where ss.sectionid = new.sectionid;

	if quota >= section_quota then
		raise exception 'section is full';
	end if;

	return new;

end;
$$
*/

CREATE TRIGGER TRIGGER_STUDENTSECTION
BEFORE
INSERT ON STUDENTSECTION
FOR EACH ROW EXECUTE PROCEDURE VALIDATE_STUDENTSECTION_INSERT();